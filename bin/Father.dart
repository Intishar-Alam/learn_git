
import 'dart:io';

// void main(){
//   print("Enter a number of celcius");
//   String input=stdin.readLineSync()!;
//
//
//   if(input != null){
//     try{
//       //conver to celcius
//       double celcius= double.parse(input);
//       // convert to feranhite
//       double feranhite=((celcius*9)/5+32);
//       print("Feranhite ${feranhite.toStringAsFixed(2)}");
//     }
//         catch(e){
//       print("Invalid. Enter a valid temparature");
//         }
//   }else{
//     print("Enter a temparature");
//   }
// }

void main() {
  // Write your dart code from here

  print("What is your name?");
  String input = stdin.readLineSync()!;

  if(input !=null){
    print("Hello, $input! Nice to meet you.");

  }else{
    print("Enter your name please");
  }

}