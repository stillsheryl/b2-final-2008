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

      # expect(@patient_1.name).to appear_before(@patient_3.name)
      # expect(@patient_3.name).to appear_before(@patient_2.name)

      patients = all('#patient-1, #patient-2, #patient-3');
      expect(patients[0]['id']).to eq(@patient_1.name);
      expect(patients[1]['id']).to eq(@patient_3.name);
      expect(patients[2]['id']).to eq(@patient_2.name);
    end
  end
end
