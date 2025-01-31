/*Develop a banking system:
An Account class with attributes: id, name, balance.
A Bank class to:
Create accounts.
Deposit and withdraw money (validate sufficient balance).
Transfer money between accounts.
Use Map to store accounts with their id as the key.
Handle errors such as invalid accounts or insufficient balance using try-catch.
*/


class Account{
  int id;
  String name;
  double balance;

  Account(this.id,this.name,this.balance);

  @override
  String toString(){
    return "Name: $name, Balance:$balance";
  }
}



class Bank{
  Map<int, Account> accounts={};

  //creating account
  Createaccount(Account account){
    if(accounts.containsKey(account.id)){
      print("Accouunt already exist");
    }
    accounts[account.id]= account;
    print("Account added");
  }

  show(){
    print("${accounts}");


  }

  Deposit(int id,double amount){
    Account account = accounts.values.firstWhere((a)=> a.id==id);
    if(!accounts.containsKey(account)) {
      print("Account didn't exist");
    }
    accounts[account.id]!.balance = accounts[account.id]!.balance + amount;
    print("Deposited. New ammount is ${account.balance}");


  }
  Withdraw(int id, double amount){
    Account account = accounts.values.firstWhere((a)=> a.id==id);
    if(!accounts.containsKey(account)) {
      print("Account didn't exist");
    }

    if(accounts[account.id]!.balance > amount){
      accounts[account.id]!.balance = accounts[account.id]!.balance - amount;
      print("Withdrawed. New ammount is ${account.balance}");
    }else{
      print("Insufficiant balance");
    }
  }

  Future Transfer(int id1,int id2, double amount)async{

    accounts[id1]!.balance = accounts[id1]!.balance - amount;
    accounts[id2]!.balance = accounts[id2]!.balance + amount;
    print("Money transferring....");

    await Future.delayed(Duration(seconds: 3));

     print("$id1 balance is ${accounts[id1]!.balance}");
     print("$id2 balance is ${accounts[id2]!.balance}");



  }
}


void main(){
  Bank bank= Bank();

  bank.Createaccount(Account(1010, "Intishar", 1000));
  bank.Createaccount(Account(2020, "Intishar", 1500));
  bank.Createaccount(Account(101010, "Intishar", 2000));

  bank.Transfer(1010, 2020, 500);


}
