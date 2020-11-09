require 'rails_helper'

RSpec.describe Hospital do
  describe 'Relationships' do
    it should{have_many :doctors}
  end

  describe "instance methods" do
    before :each do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @meredith = @hospital.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      @alex = @hospital.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
      @miranda = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      @derek = @hospital.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", university: "Stanford University")
    end

    it "#doctor_count" do
      expect(@hospital.doctor_count).to eq(4)
    end
  end
end
