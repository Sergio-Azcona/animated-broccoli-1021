class PatientsController < ApplicationController

  def index
    @patients = Patient.all

    @adult_patients = @patients.adults_only
  end 
end