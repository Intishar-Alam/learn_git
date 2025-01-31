// Create an application to monitor weather conditions for multiple cities:
// A City class with attributes: name, temperature, condition (e.g., Sunny, Rainy), and lastUpdated (DateTime).
// A WeatherMonitor class to:
// --Add city weather data.
// --Update weather conditions for a city.
// --Display cities sorted by temperature.
// --Show cities with specific weather conditions (e.g., Rainy).
// Use async to fetch new weather data (simulate using Future.delayed).

class City{
  String name;
  double temperature;
  String condition;
  DateTime lastupdated ;

  City(this.name,this.temperature,this.condition,this.lastupdated);

}
class WeatherMonitor{
  List<City> cities=[];


  // Adding new city and the weather condition
  AddCity(City city){
    if(cities.contains(city.name)){
      print("City Already Exist");
    }
    cities.add(city);
    city.lastupdated=DateTime.now();
    print("${city.name} is added");
  }

  //updating weather condition of a city
  void UpdateWeather(String cityname, double temparature,String condition){
    var city = cities.firstWhere((city)=>city.name.toLowerCase() == cityname.toLowerCase(),
        orElse: ()=> throw ArgumentError("No city found")
    );
    city.temperature=temparature;
    city.condition=condition;
    city.lastupdated=DateTime.now();
    print("Updated weather for ${cityname}");
  }
  // showing cities with their condition
  Showingwithcondition(String condition){
    var citycondition= cities.where((city)=>city.condition == condition).toList();
    print("the list of cities with this $condition condition");

    for(var condition_ in citycondition){
      print("Name: ${condition_.name},Temperature: ${condition_.temperature},Condition: ${condition_.condition},Lastupdate: ${condition_.lastupdated},");
    }

  }

  Displaycitysortedbytemp(){
    var sortedcities= List<City>.from(cities)..sort((a,b)=> a.temperature.compareTo(b.temperature));
    print("All sorted cities by temparature");
    for(var city in sortedcities){
      print("Name : ${city.name},Temp : ${city.temperature}");
    }
  }

  Future fetchweather(String cityname)async{
    print("Updating weather data for $cityname.....");
    Future.delayed(Duration(seconds: 3),()=>print("Updated weather data of $cityname"));


  }

}

void main(){
  WeatherMonitor weatherMonitor=WeatherMonitor();

  weatherMonitor.AddCity(City("New york", 20.3, "rainy", DateTime.now()));
  weatherMonitor.AddCity(City("Japan", 43.3, "sunny", DateTime.now()));
  weatherMonitor.AddCity(City("Washinton", 13.3, "sunny", DateTime.now()));
  weatherMonitor.AddCity(City("Dhaka", 29.3, "rainy", DateTime.now()));
  weatherMonitor.AddCity(City("Chittagong", 23.3, "rainy", DateTime.now()));

  weatherMonitor.Showingwithcondition("rainy");
  weatherMonitor.Displaycitysortedbytemp();
  weatherMonitor.UpdateWeather("New York", 22, "Sunny");
  weatherMonitor.Displaycitysortedbytemp();
weatherMonitor.fetchweather("New york");


}