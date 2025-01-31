/*Build an expense tracker with the following features:
A Transaction class with attributes: id, title, amount, date, and category (e.g., Food, Transport).
A Tracker class to:
--Add transactions.
--Display transactions grouped by category.
--Calculate total expenses for a given month.
Use a List to store transactions and filter them based on date and category.
Use async to simulate fetching historical transaction data from a server.
*/


import 'dart:mirrors';

class Transaction{
  int id;
  String title;
  double amount;
  DateTime date;
  String category;

  Transaction(
      this.id,
      this.title,
      this.date,
      this.amount,
      this.category
      );
}

class Tracker {
  List<Transaction> transactions = [];
  List expense=[];

   Addtransaction(Transaction transaction)  {
    print("Transaction is ${transaction.title} processing");

    transactions.add(transaction);
    expense.add(transaction.amount);
  }

  sortbydate(int month,int year){
    var transaction=transactions.where((tran)=> tran.date.month==month && tran.date.year==year).toList();
    expense.add(transaction);

    var transaction_ = expense.fold(0.0, (a, b) => a + b.amount);
    print("$transaction_");

  }
  Displaytransaction(String catagory) {


    var transaction = transactions.where((tran) => tran.category == catagory)
        .toList();

    for (var transaction_ in transaction) {
      print("id: ${transaction_.id}, Title: ${transaction_
          .title},amount: ${transaction_.amount},Date: ${transaction_.date},");
    }
  }


   calculate( int month) {
     var list= transactions.where((a,)=> a.date.month == month).toList();
    for(var hel in list){
      var total= list.fold(0.0, (a,b)=>a+b.amount);
      print(total);
    }


    }

  }






void main(){
  Tracker tracker= Tracker();


  tracker.Addtransaction(Transaction(1010, "Shop", DateTime(2024-12-05), 2020, "food"));
  tracker.Addtransaction(Transaction(2020, "efd",  DateTime(2024-11-05), 2121, "art"));
  tracker.Addtransaction(Transaction(3030, "5rrf",  DateTime(2024-10-05), 23, "food"));
  tracker.Addtransaction(Transaction(4040, "aserf",  DateTime(2024-12-05), 24, "art"));
  tracker.Addtransaction(Transaction(5050, "Shop",  DateTime(2024-12-05), 2020, "food"));
  tracker.Addtransaction(Transaction(6060, "dffr",  DateTime(2024-12-05), 2020, "food"));

  tracker.Displaytransaction("food");

  tracker.calculate(11);



}