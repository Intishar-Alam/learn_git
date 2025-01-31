/*Create a food ordering system with these requirements:
A MenuItem class with attributes: id, name, price, and isAvailable.
An Order class to:
Add menu items to an order (validate availability).
Remove items from the order.
Display the order summary (total price and items).
Use a Set to store ordered items.
Handle scenarios where unavailable items are added using try-catch.
Use Future to simulate order processing.
*/

class Menuitem{
  int id;
  String name;
  double price;
  bool isAvailable;

  Menuitem(this.id,this.name,this.price,this.isAvailable);
}

class Order{
  Set<Menuitem> orders={};

  Addmenuitems(Menuitem menuitem){
    try{
      if (!menuitem.isAvailable) {
        print("Menuitem names ${menuitem.name} is not available");
      }
      orders.add(menuitem);
      print("${menuitem.name} added");
    }catch(e){
      print(e);
    }
  }

  //removing order from order list
  Removeorder(Menuitem menuitem){
    if(!orders.contains(menuitem)){
      print("This order has already not in order list");
    }
    orders.remove(menuitem);
    print("${menuitem.name} removed");
  }

  //displaying order summary
  Displaysummary(){
    var totalitem= orders.length;
    var totalvalue= orders.fold(0.0, (a,b)=> a+ b.price);
    // print("${orders.length}");
    print("Total item is $totalitem and total price is $totalvalue");
  }

  Future<void> processorder ( ) async{
    print("Order is processing....");
    await Future.delayed(Duration(seconds: 3));
    print("Order processed succesfully");
  }

  Confirmorder(Menuitem  item){
    Addmenuitems(item);
    processorder();

  }


}

void main(){
  Order order=Order();

  final menuitem1= Menuitem(1010, "Burger", 20.2, true);
  final menuitem2= Menuitem(2020, "sandwich", 11.2, true);
  final menuitem3= Menuitem(3030, "pizza", 33.2, true);
  final menuitem4= Menuitem(4040, "chicken", 29.2, false);
  final menuitem5= Menuitem(5050, "drinks", 10.2, true);
  final menuitem6= Menuitem(6060, "flat", 3.2, true);


  order.Addmenuitems(menuitem1);
  order.Addmenuitems(menuitem2);
  order.Confirmorder(menuitem6);


   order.Displaysummary();
  //
  //  order.processorder();

}