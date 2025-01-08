

import 'dart:developer';
import 'dart:io';

abstract class father {

 late String name;
   father(this.name);

  void attend();

  void eatting(){
    print("$name is eatting rice");
  }
}

class inti extends father {

   String name;

   inti(this.name) : super('rafi');


  @override
  void attend() {

    print("$name is attending class");

  }

  @override
  void eatting() {
  }

}


class sadaf extends father {

  String name;

  sadaf(this.name) : super('rafi');


  @override
  void attend() {

    print("$name is attending class");

  }

  @override
  void eatting() {
  }

}
void main() {

  father rafi=inti('rafi');
  father sadu=sadaf('sadu');


  print(rafi is sadaf);
}













 //  print("Enter temparature");
 //  double  cel_value=  double.parse(stdin.readLineSync()!);
 //  // double ? fer_value=  double.tryParse(stdin.readLineSync()!);
 //
 //  double  a=cel_value;
 // // double ? b=fer_value;
 //
 //  double  celcius=a;
 //  double ? feranhite= ((a*9)/5+32);
 //
 //  print("Todays temparature is $celcius celcius.\n And todays temparature in feranhite is $feranhite ");
 //


 
