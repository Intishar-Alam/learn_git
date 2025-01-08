

import 'dart:io';


void main(){
/*
  List<String> StudentsName= ['Ssadaf','iismi','Intishar','Tahmina'];
  List<int> Ammount=[1000,2000,30004,00024];
  
  for(int index=0; index<StudentsName.length;index++){
    print("Hello ${StudentsName[index]} .You have a payment due which is ${Ammount[index]}");
  }

  for(String Student in StudentsName){
    print("Good Morning ${Student}. Have  NIce Day.");
  }


List<String> Studentsname=['sadaf','Jabin','Intishar'];

for(int index=0; index< Studentsname.length;index++){
  print("Good Morning ${Studentsname[index]}");
}

for (String student in Studentsname){
  print("Good morning yooo${student}");
}

print("Hello here is the function value${calculator(10, 8)}");

List<String> Studentsname=['sadaf','Jabin','Intishar'];


for(var student in Studentsname){
  print("Good morning $student");
}

Calculator_with_des(10, 20, 30, 'dhaka');
Calculator_with_des(10, 49, 39, );
Calculator_with_des(10, 20, 30, 'dhaka');
Calculator_with_des(10, 49, 3390, 'dhaka');
Calculator_with_des(3, 20, 29, );



}

 Calculator_with_des( double x ,double y, double z, [String ? des]){
  var area= x*y*z;
  if(des!=null){
    print("Total area=$area");
  }
  else{
    print("$area");
  }
*/
  try{
    print("Enter your age");
    String ? input= stdin.readLineSync();
    int age= int.parse(input!);
    print("My age is $age");


  }catch(x){
    print("Error showing in: $x");

  }
 }