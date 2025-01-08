// Create an expense management application:
// An Expense class with attributes: id, category, amount, and date.
// An ExpenseManager class to:
// Add new expenses.
// Group expenses by category.
// Calculate total expenses for a given month.
// Use a Map to group expenses by category and a List for the overall expense list.
// Use async to simulate fetching expenses from a database.

class Expense{
  int id;
  String category;
  double ammount;
  DateTime date;

  Expense(this.id,this.category,this.ammount,this.date);
}

class ExpenseManager{
  List<Expense> expenselist=[];
  List Ammount=[];



  //adding new expense
  AddExpense(int id,String category,double ammount,DateTime date){
    Expense newexpense= Expense(id, category, ammount, date );
    expenselist.add(newexpense);
    print("$id is added");
    Ammount.add(newexpense.ammount);




  }
  Listingexpense(double ammount,int month,int year,DateTime date){
    if( date.month==month && date.year==year){
      double total=Ammount.fold(0, (prv,nxt)=>prv+nxt);
      return total;
    }



  }

  Map <String,double> Groupingcatagory(){
    Map<String,double> groupexpense={};

    for( var expense in expenselist){

      groupexpense[expense.category]= expense.ammount ;


    }
     return groupexpense;
  }

  AllExpense(){

    for (var expense in expenselist) {
       double totalvalue=Listingexpense(expense.ammount,expense.date.month,expense.date.year, expense.date);

      print("id: ${expense.id},product: ${expense.category},Ammount ${expense
          .ammount},Time ${expense.date},$totalvalue");
    }

  }
  expen(){
    double x=293093+28298+23929+12839+12939+23;
    print(x);
  }



}
void main() {
  ExpenseManager expenseManager = ExpenseManager();
  expenseManager.AddExpense(10202, "makeup", 293093, DateTime(2023, 12, 5));
  expenseManager.AddExpense(28910, "shopping", 28298, DateTime(2023, 12, 5));
  expenseManager.AddExpense(42874, "Car", 23929, DateTime(2023, 12, 5));
  expenseManager.AddExpense(23374, "Toys", 12839, DateTime(2023, 12, 5));
  expenseManager.AddExpense(12893, "Cute", 12939, DateTime(2023, 3, 4));
  expenseManager.AddExpense(23827, "House", 23, DateTime(2023, 11, 2));

  expenseManager.AllExpense();







  print("${expenseManager.Groupingcatagory()}");


  expenseManager.expen();



}