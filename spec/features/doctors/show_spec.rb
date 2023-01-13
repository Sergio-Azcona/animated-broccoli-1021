require 'rails_helper'

RSpec.describe "Doctor Show Page" do 
  before(:each) do
    @hospital_1 = Hospital.create!(name: "1 Grey Sloan Memorial Hospital")
    @hospital_2 = Hospital.create!(name: "2 Seaside Health & Wellness Center")

    @meredith = @hospital_1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @alex =     @hospital_1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
    @miranda =  @hospital_2.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @derek =    @hospital_2.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", university: "University of Pennsylvania")
    
    @paitent_1 = Patient.create!(name: "Katie Bryce", age: 24)
    @paitent_2 = Patient.create!(name: "Denny Duquette", age: 39)
    @paitent_3 = Patient.create!(name: "Rebecca Pope", age: 32)
    @paitent_4 = Patient.create!(name: "Zola Shepherd", age: 2)
    @paitent_5 = Patient.create!(name: "Zero", age: 39)

    @doc_patient_1 = DoctorPatient.create!(doctor: @meredith, patient: @paitent_1)
    @doc_patient_2 = DoctorPatient.create!(doctor: @meredith, patient: @paitent_2)
    @doc_patient_3 = DoctorPatient.create!(doctor: @meredith, patient: @paitent_5)
    
    @doc_patient_4 = DoctorPatient.create!(doctor: @derek, patient: @paitent_5)
    @doc_patient_5 = DoctorPatient.create!(doctor: @derek, patient: @paitent_3)
    
    @doc_patient_6 = DoctorPatient.create!(doctor: @alex, patient: @paitent_5)
    @doc_patient_7 = DoctorPatient.create!(doctor: @alex, patient: @paitent_4)
    @doc_patient_8 = DoctorPatient.create!(doctor: @alex, patient: @paitent_1)

    visit("/doctors/#{@derek.id}")
  end

  describe "User Story 1" do
    describe "displays all of that doctor's attribute information and hospital where they work" do
      it "also displays  all of the patients this doctor has" do
        # require 'pry';binding.pry
        expect(page).to have_content(@derek.name)
        expect(page).to have_content(@derek.specialty)
        expect(page).to have_content(@derek.university)
        
        expect(page).to have_content(@paitent_3.name)
        expect(page).to have_content(@paitent_5.name)
      end
    end


  end

  
end