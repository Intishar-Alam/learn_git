
 abstract class Vehical{
  String CarName;
  String model;
  String EngCc;

  Vehical(this.model,this.CarName,this.EngCc);

  static  var inti="intih";


   Start(){
    print("The vehical is Starting");
  }

  void carintroduction(){
    print("This car is bought by my father in 2019");
  }
}

class Car extends Vehical{
  String Name;
  Car(this.Name):super('2020','premio','1500');

  @override
  Start(){
    print("$Name is Starting");
  }

}

void main(){
  Car premio= Car("PRemio F");

  print(premio.Name);
  print(premio.EngCc);
  print(premio.CarName);
  print(premio.model);

  premio.Start();
  print(Vehical.inti);


}