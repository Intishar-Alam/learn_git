


main(){
  try{
    String ? name;
    print(name!.length);
  }catch(e){
    print(e);
  }

  try{


      int name = 5;
      if(name == 5){
        throw Exception('wrong value');

      }else{
        print("Right");
      }

  }catch(e){
    print(e);
  }

  try{
    int num= int.parse('abc');
    print(num);
  } on FormatException catch (e){
    print("Wrong format");

  }catch(e){
    print(e);
  }

  try{
    List num=[10,20,30];
    print(num[5]);
  }catch(e){
    print(e);
  }

  try{
    int num= int.parse("abc");
    print(num);
  }on FormatException catch(e){
    print("Formatprblm");
  }catch(e){
    print(e);
  }


}