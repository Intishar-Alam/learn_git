
/*
25. Hospital Management System
Problem:
Design a hospital management system:
1.A Patient class with attributes: id, name, age, disease.
2.A Doctor class with attributes: id, name, specialty, and patients (List of Patient).
3.A Hospital class to:
-Assign patients to doctors based on their specialty.
-List all patients of a specific doctor.
-Display all available doctors.
4.Use Map to store doctors with their id as the key.
*/

class Patient{
  int ? id;
  int ? age;
  String ? name;
  String ? disease;
  Patient(this.id,this.age,this.name,this.disease);


   NewPatient(){
    return Patient(id , age, name, disease);
  }

}
class Doctor{
  int id;
  String name;
  String speciality;

  Doctor(this.id,this.name,this.speciality);

  List <Patient>_Patient=[];

  //add patient
  Add_Paitent(Patient patient){
    _Patient.add(patient);

  }


}
class Hospital{

  Doctor inti=Doctor(1020, 'Intishar', "Heart");
  Patient sadu=Patient(20000, 19, 'Sadaf', "Heart");

  if()

}

