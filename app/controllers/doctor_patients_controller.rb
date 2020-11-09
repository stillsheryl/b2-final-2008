class DoctorPatientsController < ApplicationController
  def destroy
    doc_relationship = DoctorPatient.select("doctor_id = #{params[:id]}").where("patient_id = #{params[:patient_id]}").pluck(:id).first
    DoctorPatient.destroy(doc_relationship)
    redirect_to "/doctors/#{params[:id]}"
  end
end
