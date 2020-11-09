class DoctorPatientsController < ApplicationController
  def destroy
    require "pry"; binding.pry
    doctor = Doctor.find(params[:id])
    doc_relationship = DoctorPatient.where("doctor_id = #{params[:id]}, patient_id = #{params[:patient_id]}")


     Patient.find(params[:id]).doctor_patients.where("patient_id = #{params[:id]}")
  end
end
