require 'rails_helper'

RSpec.describe "Patient Index Page" do 
  before(:each) do
    @hospital_1 = Hospital.create!(name: "1 Grey Sloan Memorial Hospital")
    @hospital_2 = Hospital.create!(name: "2 Seaside Health & Wellness Center")

    @meredith = @hospital_1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @alex =     @hospital_1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
    @miranda =  @hospital_2.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @derek =    @hospital_2.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", university: "University of Pennsylvania")
    
    @patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
    @patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
    @patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
    @patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)
    @patient_5 = Patient.create!(name: "Zero", age: 39)

    @doc_patient_1 = DoctorPatient.create!(doctor: @meredith, patient: @patient_1)
    @doc_patient_2 = DoctorPatient.create!(doctor: @meredith, patient: @patient_2)
    @doc_patient_3 = DoctorPatient.create!(doctor: @meredith, patient: @patient_5)
    
    @doc_patient_4 = DoctorPatient.create!(doctor: @derek, patient: @patient_5)
    @doc_patient_5 = DoctorPatient.create!(doctor: @derek, patient: @patient_3)
    
    @doc_patient_6 = DoctorPatient.create!(doctor: @alex, patient: @patient_5)
    @doc_patient_7 = DoctorPatient.create!(doctor: @alex, patient: @patient_4)
    @doc_patient_8 = DoctorPatient.create!(doctor: @alex, patient: @patient_1)
  end

  describe "User Story 3- displays the names of all adult patients only (age is greater than 18)" do
    it "displays the names in ascending alphabetical order (A - Z)" do

     visit patients_path
      #  save_and_open_page
      expect(page).to_not have_content(@patient_4)
        # require 'pry';binding.pry
      expect(@patient_2.name).to appear_before(@patient_1.name)
      expect(@patient_1.name).to appear_before(@patient_3.name)
      expect(@patient_3.name).to appear_before(@patient_5.name)

      
    end


    

  end
end