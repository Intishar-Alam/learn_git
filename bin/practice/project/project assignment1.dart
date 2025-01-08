/*13. Student Grading System
Problem:
Develop a student grading system:
A Student class with attributes: id, name, marks (Map of subjects to scores).
A GradingSystem class to:
Add students and their marks.
Calculate average marks for each student.
Assign grades based on the average (A, B, C, etc.).
List students with grades in descending order.
Handle invalid data (e.g., marks out of range) using try-catch.
*/

import 'dart:io';

class Student {
  final int id;
  final String name;
  final Map<String, double> marks;

  Student(this.id, this.name, this.marks);
}

class Gradingsystem {
  List<Student> student = [];

  AddStudent(int id, String name, Map<String, double> marks) {
    try {
          if(marks.values.any((value)=> value<0 || value>100)){
            throw ArgumentError("Your marks are invalid. Marks should be in 0 to 100}");
          }
          //ensuring no duplicate id
          else if(student.any((name)=> name.id==id)) {
            throw ArgumentError("there can't be similar id of two student");
          }
      Student newstudent = Student(id, name, marks);
      student.add(newstudent);

      // print(" Student $name added succesfully");
    }catch(e){
      print("ERROR of $name: $e");
    }
  }
//average
  Averageof(Student per) {
    double total = per.marks.values.fold(0, (prv, nxt) => prv + nxt);
    return total / per.marks.values.length;
  }
//showing all name
  Displaystudent() {
    if (student.isEmpty) {
      print("No Student available");
    } else {
      //in this loop we will give values
      for (var students in student) {
        final double Average = Averageof(students);
        final String grade=Grade(Average);
        print("Id: ${students.id},Name : ${students.name},Average:${Average.toStringAsFixed(2)},Grade:${grade}");
      }
    }
  }
//giving grade
  Grade(double average) {
    if (average >= 80 && average <= 100) {
      return "A+";
    } else if (average >= 70 && average < 80) {
      return "A";
    } else if (average >= 60 && average < 70) {
      return "B";
    } else if (average >= 50 && average < 60) {
      return "C";
    } else if (average >= 40 && average < 50) {
      return "D";
    } else if (average >= 33 && average < 40) {
      return "E";
    } else {
      return "F";
    }
  }




}

void main() {
  Gradingsystem gradingsystem = Gradingsystem();
  // gradingsystem.AddStudent(});
  gradingsystem.AddStudent(1010, "Rafi", {'math': 90, 'bangla': 85});
  gradingsystem.AddStudent(20230, "Intishar", {'math': 90, 'bangla': 85,'ict':70});
  gradingsystem.AddStudent(3834, "sadaf", {'math': 90, 'bangla': 60,'ict':82});
  gradingsystem.AddStudent(2999, "ismi", {'math': 90, 'bangla': 50,'ict':79});
  gradingsystem.AddStudent(33949, "suu", {'math': 90, 'bangla': 49,'ict':99});
  gradingsystem.AddStudent(29394, "meehedi", {'math': 90, 'bangla': 95,'ict':65});
  gradingsystem.AddStudent(1010, "rahul", {'math': 90, 'bangla': 80,'ict':88});


  gradingsystem.Displaystudent();

}
