require 'rails_helper'

RSpec.describe Doctor do
  describe 'Relationships' do
    it should{belong_to :doctors}
    it should{have_many :doctor_patients}
    it should{have_many(:patients).through(:doctor_patients)}
  end

  describe "instance methods" do
    before :each do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @meredith = @hospital.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      @patient_1 = @meredith.patients.create!(name: "Katie Bryce", age: 24)
      @patient_2 = @meredith.patients.create!(name: "Denny Duquette", age: 39)
      @patient_3 = @meredith.patients.create!(name: "Rebecca Pope", age: 32)
    end

    it "#working_hospital" do
      expect(@meredith.working_hospital).to eq(@hospital.name)
    end
  end
end
