//
//
// void main()async{
//   print("Started");
//
//   Vote(19).then((value){
//     if(value){
//       print('Able to vote');
//     }else{
//       print('unable to vote');
//     }
//   });
//
//
//   print("Finished");
// }
//
// Future <bool> Vote(int age) async{
//   if(age>18){
//     return true;
//   }else{
//     return false;
//   }
// }
//
//
// Future <void> test()async{
//
//   await Future.delayed(Duration(seconds: 5),(){
//     print("Everything has been done after 5 seconds");
//   });
//
//   print("Function finished");
//
//
// }

tkorder(String item){
  print('Taking order of $item');
}
prFood(String item){
  print("Prepare this food$item");
  Future.delayed(Duration(seconds: 2),()=>print("Your order will be given after 20 min"));
}
TkFood(String item,String name)  {
   print('Taking order of $item');
  Future.delayed(Duration(seconds: 4),()=>print("Serving order to $name"));


}
svfood(String item){
  Future.delayed(Duration(seconds: 6),()=> print("Got my $item"));

}

WorkFlow(String name, String item) async {
  try{
    await tkorder(item);
    await prFood(item);
    await TkFood(item, name);
    await svfood(item);
  }catch(e){
  print(e);

  }
}
 main()  {
  print("Welcome to kfc");
   WorkFlow("intishar","Burger");
   print('Succesful');

}