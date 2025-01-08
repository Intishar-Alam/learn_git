
class resturant{

  void Start(){
    print("Starting");
  }
}


class inti extends resturant{
  // resturant kfc= resturant();

  @override
  void Start(){
    print("Start");
  }


}
void main(){
  inti rafi=inti();

  rafi.Start();
}