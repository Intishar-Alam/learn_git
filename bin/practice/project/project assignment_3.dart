// Problem:
// Design an attendance management system:
// Create an Employee class with attributes: id, name, designation, and attendance (a map with Date as key and status as value).
// Implement the following functionalities:
// -Mark attendance (Present/Absent).
// -View attendance history for an employee.
// -Calculate the percentage of attendance for each employee.
// Use Set to ensure no duplicate employee IDs.
// Handle invalid data or operations using try-catch.

import 'dart:collection';
import 'dart:io';

class Employee {
  int id;
  String name;
  String designation;
  Map<DateTime, String> attendence = {};

  Employee({required this.id, required this.name, required this.designation});

  void MarkAttendence(DateTime date, String status) {
    if (status != "Present" && status != "Absent") {
      throw ArgumentError("Status should be \"Present\" or \"Absent\"");
    }
    attendence[date] = status;
  }

  void AttendenceHistory() {
    if (attendence.isEmpty) {
      print("$name has no attendence history");
      return;
    }
    print("Attendence history of $name");
    attendence.forEach((date, status) {
      print("${date.toLocal().toString().split("")[0]}: $status");
    });
  }

  calculateattendencepercentage() {
    if (attendence.isEmpty) return 0.0;
    int presentdays =
        attendence.values.where((status) => status == "Present").length;
    return (presentdays / attendence.length) * 100;
  }
}

class AttendenceSystem {
  Set<int> EmployeeId = HashSet();
  List<Employee> employees = [];

  AddEmployee(Employee employee) {
    if (EmployeeId.contains(employee.id)) {
      throw ArgumentError("${employee.id} Already exist ");
    }
    EmployeeId.add(employee.id);
    employees.add(employee);
  }

  Employee? getemploybyid(int id) {
    return employees.firstWhere((employee) => employee.id == id);
  }

  Displayemployes(int id) {
    Employee? employee = getemploybyid(id);
    if (employee == null) {
      print("ERROR NO EMPLOYEE ARE THERE ");
    }
    print(
        "name: ${employee!.name},id : ${employee.id},Designation : ${employee.designation}");
  }
}

void main() {
  AttendenceSystem attendenceSystem = AttendenceSystem();

  while (true) {
    print(" \n 1. Add Employee");
    print("2. Mark Attendence");
    print("3. Attendence Percantage");
    print("4. Found Employ");
    print("5. Exit the programe");
    try {
      stdout.write("Enter your choice:");
      int choice = int.parse(stdin.readLineSync()!);
      if(choice<6 && choice>0){
        if (choice == 1) {
          stdout.write("Enter Employ ID :");
          int id = int.parse(stdin.readLineSync()!);

          stdout.write("Enter Employ Name :");
          String name = stdin.readLineSync()!;

          stdout.write("Enter Designation :");
          String designation = stdin.readLineSync()!;

          attendenceSystem.AddEmployee(
              Employee(id: id, name: name, designation: designation));
          print("$name has been added as a employee");
        } else if (choice == 2) {
          stdout.write("Enter the Id :");
          int id = int.parse(stdin.readLineSync()!);

          Employee? employeeid = attendenceSystem.getemploybyid(id);
          if (employeeid == null) {
            print("ERROR: $id not found");
          }
          stdout.write("Enter the date :");
          DateTime date = DateTime.parse(stdin.readLineSync()!);

          stdout.write("Enter the status( Present/Absent) :");
          String status = stdin.readLineSync()!;

          employeeid!.MarkAttendence(date, status);
          print("Attendence Marked SUCCESSFULLY");
        } else if (choice == 3) {
          stdout.write("ENTER EMPLOYEE ID:");
          int id = int.parse(stdin.readLineSync()!);
          Employee? employee = attendenceSystem.getemploybyid(id);

          if (employee == null) {
            print("ERROR: $id not found");
          }
          double percentage = employee!.calculateattendencepercentage();
          print("${employee.name}'s attendence percantage is $percentage");
        } else if (choice == 4) {
          stdout.write("ENTER EMPLOYEE ID:");
          int id = int.parse(stdin.readLineSync()!);
          Employee? employee = attendenceSystem.getemploybyid(id);
          if (employee == null) {
            print("ERROR: $id not found");
          }
          print(attendenceSystem.Displayemployes(id));
        } else if (choice == 5) {
          stdout.write("ENTER EMPLOYEE ID:");
          int id = int.parse(stdin.readLineSync()!);
          Employee? employee = attendenceSystem.getemploybyid(id);
          if (employee == null) {
            print("ERROR: $id not found");
          }
          employee!.AttendenceHistory();
        } else {
          throw ArgumentError("Your choice should be in 1 to 5");
        }
      }else{
        print("Choice should be in 1 to 5");
      }
    } catch (e) {
      print("ERROR : ${e.toString()}");
    }
  }
}
