require 'rails_helper'

RSpec.describe Patient do
  describe 'Relationships' do
    it should{have_many :doctor_patients}
    it should{have_many(:doctors).through(:doctor_patients)}
  end

  describe "class methods" do
    before :each do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @meredith = @hospital.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      @patient_1 = @meredith.patients.create!(name: "Katie Bryce", age: 24)
      @patient_2 = @meredith.patients.create!(name: "Denny Duquette", age: 39)
      @patient_3 = @meredith.patients.create!(name: "Rebecca Pope", age: 32)
    end

    it ".patients_by_age" do
      expect(Patient.patients_by_age).to eq([@patient_2, @patient_3, @patient_1])
    end
  end
end
