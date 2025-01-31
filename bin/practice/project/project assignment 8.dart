/*
A Trip class with attributes: destination, price, availableSeats, and departureDate.
A Booking class to manage:
--Booking a trip (validate available seats).
--Canceling a booking.
--Displaying trip details.
Use a List to store trips and a Map to store user bookings.
Use async to simulate fetching trip data and validating bookings.
*/

class Trip{
  String destination;
  double price;
  int availableseats;
  DateTime departuretime;

  Trip(this.destination,this.price,this.availableseats,this.departuretime);
}
class User{
  String name;
  int phone;
  User(this.name,this.phone);
}

class Booking{
  List<Trip> trips=[];
  Map<User,String> userboooking={};
  //Adding new trip
  Addtrip(Trip trip){
    trips.add(trip);
    print("The trip of ${trip.destination} is added succesfully");
  }

  Future Bookingtrip(User user,String destination,int seats)async{

    Trip trip=trips.firstWhere((des)=> des.destination == destination);
    if(!trips.contains(trip)){
      print("No trip available for $destination");
    }
    if(trip.availableseats<seats){
      print("Not that much seat left");
    }
    trip.availableseats -=seats;
    userboooking[user]= destination;
    print("Booking tickets for ${user.name}");
    Future.delayed(Duration(seconds: 3),
            (){
                print("${user.name} has booked a trip for ${trip.destination}");
                });

  }
  //cancelation of trip
  Cancelaationtrip(User user){
    User  userr= userboooking.keys.firstWhere((des)=> des.name == user.name && des.phone == user.phone);

    userboooking.remove(userr);

    print("${user.name} has cancelled his trip");
  }
  //Displaying all trips
  Displaytrip(){
    for(var trip in trips){
      print("Destination : ${trip.destination},Price : ${trip.price},Availableseats : ${trip.availableseats},Departuretime : ${trip.departuretime}");
    }

}

}

void main(){
  Booking booking=Booking();

  booking.Addtrip(Trip("new york", 20.3, 23, DateTime.now()));
  booking.Addtrip(Trip("dhaka", 12.3, 35, DateTime.now()));
  booking.Addtrip(Trip("ctg", 22.3, 22, DateTime.now()));
  booking.Addtrip(Trip("rangamati", 33.3, 45, DateTime.now()));


  booking.Displaytrip();
  booking.Bookingtrip(User("Sadaf", 01811895438), "dhaka", 5);


}