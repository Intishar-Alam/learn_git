// Inventory Management System
// Problem:
// Develop an inventory management system:
// A Product class with attributes: id, name, quantity, and price.
// An Inventory class to:
//- Add new products to inventory.
//- Update product quantity.
// -Calculate the total value of inventory.
// Use Map to store products with their id as the key.
// Handle invalid operations (e.g., updating non-existent products) using try-catch.
import 'dart:io';
import 'dart:collection';
class Product{
  int id;
  String name;
  int quantity;
  double price;

  Product(this.id,this.name,this.quantity,this.price);

  double get totalValue=> quantity*price;
}

class Inventory{
  //List <Product> products=[];
  Map<int,Product> products={};


  AddProduct(Product product){
    if(products.containsKey(product.id)){
      print("${product.id} already exist");
    }
    products[product.id]=product;
    print("Product added");
  }
  GetProductbyid( int id){
    return products.values.firstWhere((product)=> product.id == id);
  }


  Updateproductquantity(int id, int quantity){
    if(products.containsKey(id)){
      products[id]!.quantity=quantity;
      print("Quantity updatted");

    }else{
      print("no product found with this $id");
    }

  }

  double ? calculatethevalue(){
     return products.values.fold(0.0, (sum , product)=> sum! + product.totalValue);


  }

}

void main(){
  Inventory inventory=Inventory();

  while(true){
    print(" \n 1. Add Product");
    print("2. Update Quantity");
    print("3. Calculate total value of Inventory");
    print("4. Get product by id");
    print("5. Exit the programe");
    try{
      stdout.write("ENTER CHOICE");
      int choice= int.parse(stdin.readLineSync()!);
      if(choice<6 && choice>0){
        if(choice==1){
          stdout.write("Enter Product ID:");
          int id=int.parse(stdin.readLineSync()!);

          stdout.write("Enter Product NAME:");
          String name=stdin.readLineSync()!;

          stdout.write("Enter Product quantity:");
          int quantity=int.parse(stdin.readLineSync()!);

          stdout.write("Enter Product Price:");
          double price=double.parse(stdin.readLineSync()!);

          inventory.AddProduct(Product(id, name, quantity, price));
          print("$id product is added");

        }else if(choice ==2){

        }else if(choice ==3){

        }else if(choice ==4){

        }else if(choice ==5){

        }



      }else{
        print("Choice should be in 1 to 5");
      }

    }catch(e){
      print("ERROR : $e");
    }




  }


}