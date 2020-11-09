# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Hospitals
@hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")

#Doctors
@meredith = @hopital.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
@alex = @hospital.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
@miranda = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
@derek = @hospital.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", university: "Stanford University")

#Patients
@patient_1 = @meredith.patients.create!(name: "Katie Bryce", age: 24)
@patient_2 = @meredith.patients.create!(name: "Denny Duquette", age: 39)
@patient_3 = @meredith.patients.create!(name: "Rebecca Pope", age: 32)
