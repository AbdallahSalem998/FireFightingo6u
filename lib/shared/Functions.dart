// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firefightingsystem/models/sensor_model.dart';
//
//
// class Functions {
//
//   bool  SmokeDdanger=false,GasDdanger=false,FireDdanger=false,HeatDdanger=false;
//   double smokeSensor=10,gasSensor=10,fireSensor=10,heatSensor=10;
// /////////////////////
//   bool? DangerState() {
//     smokeDanger();
//     gasDanger();
//     fireDanger();
//     heatDanger();
//     if (SmokeDdanger)
//     {
//       return true;
//     }
//     else if (GasDdanger)
//     {
//       return true;
//     }
//     else if (FireDdanger)
//     {
//       return true;
//     }
//     else if (HeatDdanger)
//     {
//       return true;
//     }
//
//   }
//
// /////////////////////
//   bool? smokeDanger(){
//     if (smokeSensor >= 20) {
//       SmokeDdanger=true;
//       return true;
//     }
//     else{
//       SmokeDdanger=false;
//     }
//   }
//   bool? gasDanger(){
//     if (gasSensor >= 20) {
//       GasDdanger=true;
//       return true;
//     }
//     else{
//       GasDdanger=false;
//     }
//   }
//   bool? fireDanger(){
//     if (fireSensor >= 20) {
//       FireDdanger=true;
//       return true;
//     }
//     else{
//       FireDdanger=false;
//     }
//   }
//   bool? heatDanger(){
//     if (heatSensor >= 20) {
//       HeatDdanger=true;
//       return true;
//     }
//     else{
//       HeatDdanger=false;
//     }
//   }
//
//
//   // void AfterSwitchChange(bool door,bool window,bool electric,bool gas,bool alarm) {
//   //   var sen = SensorModel(Door: door, Window: window, Electricity: electric, Gas: gas, Alarm: alarm);
//   // }
//   void AfterSwitchChange(double door,double window,double electric,double gas)
//   {
//     var sen = SensorModel(flame: fireSensor,gas: gasSensor, smoke: smokeSensor, heat: heatSensor);
//   }
//   static CollectionReference<SensorModel> getDataCollection()
//   {
//     return FirebaseFirestore.instance
//         .collection(SensorModel.COLLECTION_NAME)
//         .withConverter<SensorModel>(fromFirestore: (snapshot, options) {
//       return SensorModel.fromJson(snapshot.data()!);
//     },
//       toFirestore: (value, options) {
//         return value.toJson();
//       },);
//   }
//
//   static void sendData(SensorModel sensorModel)
//   {
//     var collection = getDataCollection();
//     var docRef = collection.doc("TheSensorData");
//     docRef.set(sensorModel);
//
//   }
//
// }
// TODO this is the scaffold of the sensor area
//    return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, SideBarScreen.routeName);
//               },
//               icon: Icon(Icons.arrow_forward_ios))
//         ],
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//       ),
//       body:
//       FirebaseAnimatedList(
//           query: ref,
//           itemBuilder: (context, snapshot, animation, int index) {
//             return
//               Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Text(
//                     "Sensors Area",
//                     style: Theme.of(context).textTheme.titleMedium,
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 32.h),
//                   Container(
//                     decoration: BoxDecoration(
//                         border: Border.symmetric(
//                             horizontal: BorderSide(
//                       width: 1.sp,
//                       color: lightGreyColor,
//                     ))),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       child: Row(
//                         children: [
//                           Column(
//                             children: [
//                               Row(
//                                 children: [
//
//                                         //TODO: this would be the realtime reads
//
//                                   Text(
//
//                                     snapshot.child("irflame").value.toString().isEmpty?"no data":snapshot.child("irflame").value.toString()
//                                     ,
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .titleLarge
//                                         ?.copyWith(fontWeight: FontWeight.w500),
//                                   ),
//                                   SizedBox(width: 8.w),
//                                   Text(
//                                     "\u2103",
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .titleLarge
//                                         ?.copyWith(fontWeight: FontWeight.w500),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 8.h),
//                               Text(
//                                 "Normal dgree",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyMedium
//                                     ?.copyWith(color: yellowColor),
//                               )
//                             ],
//                           ),
//                           Spacer(),
//                           Icon(
//                             Icons.thermostat,
//                             color: Color(0xFF0E6912),
//                             size: 40.sp,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   Container(
// // width: 311.41.w,
// // height: 72.h,
//                     decoration: BoxDecoration(
//                         border: Border.symmetric(
//                             horizontal: BorderSide(
//                       width: 1.sp,
//                       color: lightGreyColor,
//                     ))),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.warning_amber,
//                             size: 30.sp,
//                             color: Color(0xFFECFF16),
//                           ),
//                           SizedBox(
//                             width: 8.w,
//                           ),
//                           Text(" Fire detected",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .titleLarge
//                                   ?.copyWith(fontSize: 16)),
//                           Spacer(),
//                           Icon(
//                             Icons.local_fire_department,
//                             color: lightRedColor,
//                             size: 40.sp,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   Container(
// // width: 311.41.w,
// // height: 72.h,
//                     decoration: BoxDecoration(
//                         border: Border.symmetric(
//                             horizontal: BorderSide(
//                       width: 1.sp,
//                       color: lightGreyColor,
//                     ))),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       child: Row(
//                         children: [
//                           Text(
//                             "No Gas detected",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyMedium
//                                 ?.copyWith(color: yellowColor),
//                           ),
//                           Spacer(),
//                           Icon(
//                             Icons.cloud_done,
//                             size: 40.sp,
//                             color: lightGreyColor,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   Container(
// // width: 311.41.w,
// // height: 72.h,
//                     decoration: BoxDecoration(
//                         border: Border.symmetric(
//                             horizontal: BorderSide(
//                       width: 1.sp,
//                       color: lightGreyColor,
//                     ))),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       child: Row(
//                         children: [
//                           Text(
//                             "No Smoke detected",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyMedium
//                                 ?.copyWith(color: yellowColor),
//                           ),
//                           Spacer(),
//                           Icon(
//                             Icons.smoke_free,
//                             size: 40.sp,
//                             color: lightGreyColor,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//           ),
//     );

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

String? flame;
String? heat;
String? smoke;
String? gas;

DatabaseReference flameRef = FirebaseDatabase.instance.ref('sensor/irflame');
DatabaseReference mq135Ref = FirebaseDatabase.instance.ref('sensor/mq135');
DatabaseReference mq5Ref = FirebaseDatabase.instance.ref('sensor/mq5');
DatabaseReference ds18b20Ref = FirebaseDatabase.instance.ref('sensor/ds18b20');

class Functions extends StatelessWidget {
  const Functions({super.key});

  @override
  Widget build(BuildContext context) {

  mq135Ref.onValue.listen((DatabaseEvent event) {final data = event.snapshot.value;smoke=data.toString();});
  flameRef.onValue.listen((DatabaseEvent event) {final data = event.snapshot.value;flame=data.toString();});
  mq5Ref.onValue.listen((DatabaseEvent event) {final data = event.snapshot.value;gas=data.toString();});
  ds18b20Ref.onValue.listen((DatabaseEvent event) {final data = event.snapshot.value;heat=data.toString();});


  return const Placeholder();
  }
}

