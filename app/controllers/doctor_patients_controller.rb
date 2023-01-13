class DoctorPatientsController < ApplicationController

  def destroy
    doc = Doctor.find(params[:doctor_id])
    
    remove_patient = DoctorPatient.find_by(doctor_id: params[:doctor_id], patient_id: params[:id])
    remove_patient.destroy
    
    # require 'pry';binding.pry
    redirect_to "/doctors/#{doc.id}"
  end
end