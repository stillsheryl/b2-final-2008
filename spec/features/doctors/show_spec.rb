require 'rails_helper'

describe "Doctors Show Page" do
  describe "As a visitor" do

    before :each do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @meredith = @hospital.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      @patient_1 = @meredith.patients.create!(name: "Katie Bryce", age: 24)
      @patient_2 = @meredith.patients.create!(name: "Denny Duquette", age: 39)
      @patient_3 = @meredith.patients.create!(name: "Rebecca Pope", age: 32)
    end

    it "shows all of that doctor's information including name, specialty and university, the hospital where the doctor works, and the names of all of that doctors patients" do
      visit "/doctors/#{@meredith.id}"

      expect(page).to have_content(@meredith.name)
      expect(page).to have_content(@meredith.specialty)
      expect(page).to have_content(@meredith.university)

      expect(page).to have_content(@hospital.name)

      expect(page).to have_content(@patient_1.name)
      expect(page).to have_content(@patient_2.name)
      expect(page).to have_content(@patient_3.name)
    end

    it "Next to each patient's name there's a button to remove that patient from that doctor's caseload, and when I click that button for one patient I'm brought back to the Doctor's show page and I no longer see that patient's name listed" do
      visit "/doctors/#{@meredith.id}"

      expect(page).to have_content(@patient_1.name)

      within "#patient-#{@patient_1.id}" do
        click_button('Remove Patient')
      end

      expect(current_path).to eq("/doctors/#{@meredith.id}")

      expect(page).to_not have_content(@patient_1.name)
    end
  end
end
