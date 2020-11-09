require 'rails_helper'

describe "Patients Show Page" do
  describe "As a visitor" do

    before :each do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @meredith = @hospital.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      @patient_1 = @meredith.patients.create!(name: "Katie Bryce", age: 24)
      @patient_2 = @meredith.patients.create!(name: "Denny Duquette", age: 39)
      @patient_3 = @meredith.patients.create!(name: "Rebecca Pope", age: 32)
    end

    it "shows the names of all patients listed from oldest to youngest" do
      visit "/patients"

      within '.patients' do
        expect(page.all('li')[0]).to have_content(@patient_2.name)
        expect(page.all('li')[1]).to have_content(@patient_3.name)
        expect(page.all('li')[2]).to have_content(@patient_1.name)
      end
    end
  end
end
