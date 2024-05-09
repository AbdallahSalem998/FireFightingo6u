import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firefightingsystem/models/sensor_model.dart';


class Functions {

  bool  SmokeDdanger=false,GasDdanger=false,FireDdanger=false,HeatDdanger=false;
  double smokeSensor=10,gasSensor=10,fireSensor=10,heatSensor=10;
/////////////////////
  bool? DangerState() {
    smokeDanger();
    gasDanger();
    fireDanger();
    heatDanger();
    if (SmokeDdanger)
    {
      return true;
    }
    else if (GasDdanger)
    {
      return true;
    }
    else if (FireDdanger)
    {
      return true;
    }
    else if (HeatDdanger)
    {
      return true;
    }

  }

/////////////////////
  bool? smokeDanger(){
    if (smokeSensor >= 20) {
      SmokeDdanger=true;
      return true;
    }
    else{
      SmokeDdanger=false;
    }
  }
  bool? gasDanger(){
    if (gasSensor >= 20) {
      GasDdanger=true;
      return true;
    }
    else{
      GasDdanger=false;
    }
  }
  bool? fireDanger(){
    if (fireSensor >= 20) {
      FireDdanger=true;
      return true;
    }
    else{
      FireDdanger=false;
    }
  }
  bool? heatDanger(){
    if (heatSensor >= 20) {
      HeatDdanger=true;
      return true;
    }
    else{
      HeatDdanger=false;
    }
  }


  void AfterSwitchChange(bool door,bool window,bool electric,bool gas,bool alarm)
  {
    var sen = SensorModel(Door: door, Window: window, Electricity: electric, Gas: gas, Alarm: alarm);
  }

  static CollectionReference<SensorModel> getDataCollection()
  {
    return FirebaseFirestore.instance
        .collection(SensorModel.COLLECTION_NAME)
        .withConverter<SensorModel>(fromFirestore: (snapshot, options) {
      return SensorModel.fromJson(snapshot.data()!);
    },
      toFirestore: (value, options) {
        return value.toJson();
      },);
  }

  static void sendData(SensorModel sensorModel)
  {
    var collection = getDataCollection();
    var docRef = collection.doc("TheSensorData");
    docRef.set(sensorModel);

  }

}
