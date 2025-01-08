// abstract class ResturantService{
//   void FoodOrder();
//   void Bill();
//   void OrderTime();
//   void conditions();
// }
//
//
// class Crimson implements ResturantService{
//   @override
//   void Bill() {
//     print("CrimsonCup is providing you affordable bill");
//   }
//
//   @override
//   void FoodOrder() {
//     print("CrimsonCup is taking order frequentlyl");
//   }
//
//   @override
//   void OrderTime() {
//     print("CrimsonCup Ordertime time is very less");
//   }
//
//   @override
//   void conditions() {
//     print("CrimsonCup has no condition for ordering");
//   }
//
// }
//
// class OroRoaster implements ResturantService{
//   @override
//   void Bill() {
//     print("OroRoaster is providing you affordable bill");
//   }
//
//   @override
//   void FoodOrder() {
//     print("OroRoaster is taking order frequentlyl");
//   }
//
//   @override
//   void OrderTime() {
//     print("OroRoaster Ordertime time is very less");
//   }
//
//   @override
//   void conditions() {
//     print("OroRoaster has no condition for ordering");
//   }
// }
// main(){
//   ResturantService crimson= Crimson();
//   ResturantService oro= OroRoaster();
//
//   crimson.Bill();
//   print("===============");
//   oro.Bill();
//
// }


class Student {
  final int id;
  final String name;
  final Map<String, double> marks; // Subject to marks mapping

  Student(this.id, this.name, this.marks);
}

class GradingSystem {
  final List<Student> students = [];

  // Add a student
  void addStudent(int id, String name, Map<String, double> marks) {
    try {
      // Validate marks
      if (marks.values.any((mark) => mark < 0 || mark > 100)) {
        throw ArgumentError('Marks should be between 0 and 100.');
      }
      // Ensure no duplicate student ID
      if (students.any((student) => student.id == id)) {
        throw ArgumentError('Student with the same ID already exists.');
      }
      // Add the student
      students.add(Student(id, name, marks));
    } catch (e) {
      print('Error: $e');
    }
  }

  // Calculate the average marks for a student
  double calculateAverage(Student student) {
    final totalMarks = student.marks.values.reduce((a, b) => a + b);
    return totalMarks / student.marks.length;
  }

  // Assign grade based on average marks
  String assignGrade(double average) {
    if (average >= 90) return 'A';
    if (average >= 80) return 'B';
    if (average >= 70) return 'C';
    if (average >= 60) return 'D';
    return 'F';
  }

  // Get students with grades in descending order
  List<Map<String, dynamic>> listStudentsWithGrades() {
    return students
        .map((student) {
      final average = calculateAverage(student);
      final grade = assignGrade(average);
      return {
        'id': student.id,
        'name': student.name,
        'average': average,
        'grade': grade,
      };
    })
        .toList()
      ..sort((a, b) => b['average'].compareTo(a['average'])); // Descending order
  }
}

void main() {
  final gradingSystem = GradingSystem();

  // Adding students
  gradingSystem.addStudent(1, 'Alice', {'Math': 95, 'Science': 88, 'English': 92});
  gradingSystem.addStudent(2, 'Bob', {'Math': 75, 'Science': 65, 'English': 70});
  gradingSystem.addStudent(3, 'Charlie', {'Math': 85, 'Science': 78, 'English': 80});

  // Attempting to add invalid data
  gradingSystem.addStudent(4, 'Diana', {'Math': 110, 'Science': 50}); // Invalid marks
  gradingSystem.addStudent(1, 'Eve', {'Math': 90, 'Science': 80}); // Duplicate ID

  // Listing students with grades
  final gradedStudents = gradingSystem.listStudentsWithGrades();
  for (var student in gradedStudents) {
    print('ID: ${student['id']}, Name: ${student['name']}, '
        'Average: ${student['average'].toStringAsFixed(2)}, Grade: ${student['grade']}');
  }
}
