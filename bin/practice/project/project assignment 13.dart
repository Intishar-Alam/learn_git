/*Design an online shopping cart system:
A Product class with attributes: id, name, price, and quantity.
A Cart class to:
--Add products to the cart.
--Remove products from the cart.
--Calculate the total price of the cart.
--Apply a discount code if provided (e.g., "SAVE10" gives 10% off).
Use a List to store products in the cart.
Handle scenarios where invalid discount codes are used using try-catch.
*/

class Product{
  int id;
  String name;
  double price;
  int quantity;

  Product(this.id,this.name,this.price,this.quantity);
}

class Cart{
  List<Product> cart=[];

  Addproduct(Product product){
    if(cart.contains(product)){
      print("${product.name} already exist in cart");
    }
    cart.add(product);
    print("${product.name} is added to cart");
  }

  Removeproduct(int id){
    Product product= cart.firstWhere((item)=> item.id==id);

    if(cart.contains(product)){
      cart.remove(product);
    }else{
      print("Product not found");
    }
  }

  Calculatingtotal(){
    var totalvalue= cart.fold(0.0, (a,b)=> a+ b.price);

    return totalvalue;

  }

  Future Processorder(String code)async{
    if(code != "Save10"){
      print("No discount available");
      print("Your total price is ${Calculatingtotal()}");
      print("Transaction is processing");
      Future.delayed(Duration(seconds: 2),(){
        print("Amount of ${Calculatingtotal()} is succesfully transacted");
      });
    }else{
      print("10% discount applied");
      var total= Calculatingtotal()-(Calculatingtotal()/10);
      print("Your total price is ${total}");
      print("Transaction is processing");
      Future.delayed(Duration(seconds: 2),(){
        print("Amount of ${total} is succesfully transacted");
      });

    }
  }

}
void main(){
  Cart cart= Cart();

  //adding item to cart
  cart.Addproduct(Product(1010, "Makeup", 20, 10));
  cart.Addproduct(Product(2020, "chips", 11.4, 10));
  cart.Addproduct(Product(3030, "gracerry", 24.5, 10));
  cart.Addproduct(Product(4040, "homedecor", 1.5, 10));
  cart.Addproduct(Product(5050, "car", 2.3, 10));

  cart.Calculatingtotal();

  cart.Processorder("Save10");


}