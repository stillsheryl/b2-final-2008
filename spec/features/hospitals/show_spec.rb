require 'rails_helper'

describe "Hospital Show Page" do
  describe "As a visitor" do

    before :each do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @meredith = @hospital.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      @alex = @hospital.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
      @miranda = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      @derek = @hospital.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", university: "Stanford University")
      @patient_1 = @meredith.patients.create!(name: "Katie Bryce", age: 24)
      @patient_2 = @meredith.patients.create!(name: "Denny Duquette", age: 39)
      @patient_3 = @meredith.patients.create!(name: "Rebecca Pope", age: 32)
    end

    it "shows the hospital's name, the number of doctors that work at this hospital, and a unique list of universities that this hospital's doctors attended" do
      visit "/hospitals/#{@hospital.id}"

      expect(page).to have_content(@hospital.name)

      expect(page).to have_content("Number of Doctors: 4")

      expect(page).to have_content("Harvard University")
      expect(page).to have_content("Johns Hopkins University")
      expect(page).to have_content("Stanford University", count: 1)
    end
  end
end
