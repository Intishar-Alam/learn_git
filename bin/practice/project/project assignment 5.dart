//  Hospital Management System
// Problem:
// Design a hospital management system:
// A Patient class with attributes: id, name, age, disease.
// A Doctor class with attributes: id, name, specialty, and patients (List of Patient).
// A Hospital class to:
// --Assign patients to doctors based on their specialty.++
// --List all patients of a specific doctor.++
// --Display all available doctors.++
// Use Map to store doctors with their id as the key
//
// .


import 'dart:io';

class Patient{
  int id;
  String name;
  int age;
  String disease;

  Patient(this.id,this.name,this.age,this.disease);
}
class Doctor{
  int id;
  String name;
  String speciality;
  List<Patient> patients=[];

  Doctor(this.id,this.name,this.speciality);

  Addpatient(Patient patient){
    patients.add(patient);
  }
}

class Hospital{
  Map<int,Doctor> doctors={};
  List<Patient> patients=[];
//Add new doctor
  AddDoctor(Doctor doctor){
    if(doctors.containsKey(doctor.id)){
      print('${doctor.id} Doctor already exists');
    }
    doctors[doctor.id]=doctor;
  }
//assigning doctor to patients for their speciality
  Assigndoctor(Patient patient){
    Doctor ? assingeddoctor= doctors.values.firstWhere((doctor)=> doctor.speciality.toLowerCase()==patient.disease.toLowerCase());

    if(assingeddoctor != null){
      assingeddoctor.Addpatient(patient);
      print("${assingeddoctor.name} is assigned for ${patient.name}");

    }else{
      print("No Doctor available");
    }
    patients.add(patient);

  }
  //showing available doctors
  SHowingdoctors(){
    if(doctors.isEmpty){
      print("No doctor available");
    }


    print('Avaiable doctors:');
    for(var doctor in doctors.values){
      print("Name : ${doctor.name},speciality : ${doctor.speciality}");
    }



  }

  //List of the patients of the doctor
  listofPatients(int DoctorId){
    Doctor ? doctor = doctors[DoctorId];

    if(doctor!=null){
      for (var patient in doctor!.patients) {
        print("Patient details: \n Name: ${patient.name},");
      }
    }else{
      print("No patient available");
    }
  }
}

void main(){
  Hospital hospital=Hospital();
  while(true) {
    print(" \n 1. Add Doctor");
    print("2. Add patient and assign doctor");
    print("3. Available doctors");
    print("4. List of patients of a doctor");
    print("5. Exit the programe");
    try{
      stdout.write("Enter your choice:");
      int choice = int.parse(stdin.readLineSync()!);

      if(choice>0 && choice<6){
        if(choice== 1){
          stdout.write("Enter doctor id:");
          int id = int.parse(stdin.readLineSync()!);
          stdout.write("Enter doctor Name:");
          String name = stdin.readLineSync()!;
          stdout.write("Enter doctor Speciality:");
          String speciality = stdin.readLineSync()!;

          hospital.AddDoctor(Doctor(id, name, speciality));
          print("${name} is added");

        }else if(choice ==2){
          stdout.write("Enter patient id:");
          int id = int.parse(stdin.readLineSync()!);
          stdout.write("Enter patient Name:");
          String name = stdin.readLineSync()!;
          stdout.write("Enter patient age:");
          int age = int.parse(stdin.readLineSync()!);
          stdout.write("Enter patient Speciality:");
          String disease = stdin.readLineSync()!;

          hospital.Assigndoctor(Patient(id, name, age, disease));


        }else if(choice ==3){
          hospital.SHowingdoctors();

        }else if(choice ==4){
          stdout.write("Enter doctor id:");
          int id = int.parse(stdin.readLineSync()!);

          print("${hospital.listofPatients(id)}");

        }else if(choice ==5){

        }


      }else{
        print("choice should be in 1 to 5");
      }

    }catch(e){}



  }
}