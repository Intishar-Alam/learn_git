/*Create an event management system:
An Event class with attributes: id, name, date, location, and participants (a Set of names).
A EventManager class to:
--Create new events.
--Add participants to an event (avoid duplicates).
--List upcoming events (filter by date).
Use async to simulate sending notifications to participants about their events.
*/


class Event{
  int id;
  String name;
  DateTime date;
  String location;
  Set<String> praticipents={};

  Event(this.id,this.name,this.date,this.location);

  addparticipents(String participent){
    praticipents.add(participent);
  }
}

class Eventmanager{
  List<Event> events=[];


  Addingparticipents(int id, String name ){
    var event= events.firstWhere((party)=>party.id == id ,orElse: ()=> throw Exception("nothing"));

    event.addparticipents(name);



  }

  Newevent( Event event){
    if(events.contains(event)){
      print("Event already exist");
    }
    events.add(event);
    print("The event of ${event.location} is added as a new event");
  }
}

