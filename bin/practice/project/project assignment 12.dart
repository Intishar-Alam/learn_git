/*Design a smart home controller application:
Create a Device class with attributes: id, name, status (On/Off).
A SmartHome class to manage devices:
Turn devices on/off.
List all devices and their statuses.
Filter devices based on their status.
Use List to store devices.
Simulate fetching device data and updating statuses using Future and async.*/


class Device{
  int id;
  String name;
  String status;

  Device(this.id,this.name,this.status);
}
class Smarthome{
  List<Device> devices=[];
  Map<String, Device> _devices={};

  AddDevice(Device device){
    if(devices.contains(device)){
      print("Device already exist");
    }
    if(device.status.toLowerCase() != "on" && device.status.toLowerCase() != "off" ){
      throw ArgumentError("Device should should be on or off");
    }
    devices.add(device);

  }

  Future Turndevice(int id)async{
    Device device = devices.firstWhere((dev)=> dev.id == id);
    print("Device status changing...");


    if(device.status== "On"){
      device.status = "off";
    }else{
      device.status = "On";
    }
    Future.delayed(Duration(seconds: 3),(){
      print("${device.name  } is turned ${device.status} ");
    });

  }

  //List all devices and their statuses.
  filterdevices(String status){
    var item= devices.where((dev)=> dev.status.toLowerCase() == status.toLowerCase()).toList();

    for(var items in item){
      print("Device Name: ${items.name},Device id: ${items.id},Device Status: ${items.status},");
    }
  }
}

void main(){

  Smarthome smarthome=Smarthome();

  smarthome.AddDevice(Device(1010, "remote", "On"));
  smarthome.AddDevice(Device(2020, "ac", "On"));
  smarthome.AddDevice(Device(3030, "tv", "off"));
  smarthome.AddDevice(Device(4040, "fridge", "On"));


  smarthome.Turndevice(2020);
  smarthome.filterdevices("On");



}