/*
Problem:
Build a shopping cart system with the following functionality:
A Product class with attributes: id, name, price, and stockQuantity.
A ShoppingCart class to:
--Add products to the cart (validate stock).
--Remove products from the cart.
--Calculate the total price.
Handle invalid inputs (e.g., adding an unavailable product) using try-catch.
Use Map to store cart items with quantities.
Simulate updating stock after checkout using a Future to mimic async operations.
*/

class Product{
   int id;
   String name;
   double price;
   int stockquantity;

   Product(this.id,this.name,this.price,this.stockquantity);

   @override
   String toString() {
     return 'Product: $name, Price: \$${price.toStringAsFixed(2)}, Stock: $stockquantity';
   }

}

class ShoppingCart{
  List<Product> products=[];
  Map<Product,int> cart={};

  AddProduct(Product product){
    if(products.contains(product.id)){
      print("product Already exist. If you want to update the quantity then go to another section");
    }
    products.add(product);
    print("${product.name} is added to the product list");
  }

  Addproducttocart(int productid ,int quantity){
    try{
      Product product = products.firstWhere((p) => p.id == productid,
          orElse: () => throw ArgumentError("no id found"));
      if (quantity <= 0) {
        throw ArgumentError("Quantity shoulde be atleast 1");
      }
      if (product.stockquantity < quantity) {
        print("not enough product left");
      }
      if (cart.containsKey(product)) {
        cart[product] = cart[product]! + quantity;
      } else {
        cart[product] = quantity;
      }
      product.stockquantity -= quantity;
      print("${product.name} added into cart");
    }catch(e){
      print(e);
    }
  }

  removefromcart(int productid ){
    try{
      Product product = products.firstWhere((p) => p.id == productid,
          orElse: () => throw ArgumentError("no id found"));

      if(cart.containsKey(product)){
        cart.remove(product);
      }

    }catch(e){
      print(e);
    }

}

  double calculatetotal(){
    return cart.entries.map((entry)=> entry.key.price * entry.value).reduce((value, element)=> value+ element);
  }

  Future checkout() async{
    print("Payment is processing plz wait");
    Future.delayed(Duration(seconds: 3),()=> print("Payment done. Thank you for choosing us"));
  }
}

void main(){
  ShoppingCart shoppingCart=ShoppingCart();
  shoppingCart.AddProduct(Product(1010, "Makeup", 20, 11));
  shoppingCart.AddProduct(Product(2020, "apple", 20, 11));
  print("${shoppingCart.products}");

  shoppingCart.Addproducttocart(1010, 2);
  shoppingCart.Addproducttocart(2020, 2);

  print("${shoppingCart.products}");
  print("${shoppingCart.calculatetotal()}");
  shoppingCart.checkout();
  print("${shoppingCart.cart}");




}


// if(products.contains(productid)){
// if(product != null){
// cart[productid]=quantity;
// print("${product.name} is added to cart");
//
// }
// }else{
// print('No product found');
// }
