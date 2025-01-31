/*Create a Book class with attributes: id, title, author, isAvailable.
Create a Library class that can:
--Add new books.
--Borrow books (change isAvailable to false).
--Return books (change isAvailable to true).
List all available books.
Search for books by title or author.
Use Map to store books with their id as the key.
Handle invalid operations (e.g., borrowing unavailable books) using try-catch.*/

class Book{
  int id;
  String title;
  String author;
  bool isavailable;

  Book(this.id,this.title,this.author,this.isavailable);
}

class Library{
  Map<int,Book> books={};

  Addnewbooks(Book book ){
    if(books.containsKey(book.id)){
      print("Book already exist");
    }
    books[book.id]= book;
  }




  Borrowingbook(int id){
    Book book = books.values.firstWhere((book_)=> book_.id == id);

    if(book.isavailable==true){
      book.isavailable= false;
      print("${book.title} borrowed");


    }else{
      print("Book is not available");
    }

  }
  Returningbook(int id){
    Book book = books.values.firstWhere((book_)=> book_.id == id);

    try {
      if(book.isavailable==false){
        book.isavailable= true;
        print("${book.title} returned");

      }else{
        print("Book is not available");
      }
    }  catch (e) {
      print(e);
    }

  }
  Avaiablebooks(){
    print("All available books");
    try {
      for(var book in books.values){
        if(book.isavailable == true){
          print("Title: ${book.title}");
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Searchbook(String title){
    for(var book in books.values){
      if(book.title.toLowerCase() == title.toLowerCase()){
        print("Name : ${book.title},Author: ${book.author}");
      }

    }
  }

}

void main(){
  Library library=Library();

  library.Addnewbooks(Book(1010, "ASHISH", "Sadaf", true));
  library.Addnewbooks(Book(2020, "bhaluk", "Sadaf", true));
  library.Addnewbooks(Book(3030, "ghura", "inti", true));
  library.Addnewbooks(Book(4040, "lambu", "Sadaf", true));
  library.Addnewbooks(Book(5050, "lathi", "Sadaf", true));
  library.Addnewbooks(Book(6060, "sadu", "Sadaf", true));



  library.Searchbook("ghura");
  library.Avaiablebooks();
  library.Borrowingbook(2020);
  library.Avaiablebooks();

}