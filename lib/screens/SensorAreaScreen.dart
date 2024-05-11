import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firefightingsystem/models/sensor_model.dart';
import 'package:firefightingsystem/screens/SidebarScreen.dart';
import 'package:firefightingsystem/shared/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Scaffold(
// appBar: AppBar(
// actions: [IconButton(onPressed: (){
// Navigator.pushNamed(context, SideBarScreen.routeName);
// }, icon: Icon(Icons.arrow_forward_ios))],
// centerTitle: true,
// backgroundColor: Colors.transparent,
// ),
// body: StreamBuilder<QuerySnapshot<SensorModel>>(
// stream: sensorRef.snapshots(),
// builder: (context, snapshot) {
// // if (snapshot.hasError) {
// //   return Center(
// //   child: Text(snapshot.error.toString()),
// // );
// // }
// //
// // if (!snapshot.hasData) {
// //   return const Center(child: CircularProgressIndicator());
// // }
// //
// // final data = snapshot.requireData;
// //
// // if (tempList == null) {
// // tempList = List.filled(5, data.docs.first.data().temperature,
// // growable: true);
// // } else {
// // tempList!.add(data.docs.first.data().temperature);
// // tempList!.removeAt(0);
// // }
// //
// // if (rhList == null) {
// // rhList =
// // List.filled(5, data.docs.first.data().humidity, growable: true);
// // } else {
// // rhList!.add(data.docs.first.data().humidity);
// // rhList!.removeAt(0);
// // }
//
// if (snapshot.hasError) {
// return Center(
// child: Text(snapshot.error.toString()),
// );
// }
//
// if (!snapshot.hasData) {
// return const Center(child: CircularProgressIndicator());
// }
//
// final data = snapshot.requireData;
//
// if (smoke == null) {
// smoke = List.filled(5, data.docs.first.data().smoke,
// growable: true);
// } else {
// smoke!.add(data.docs.first.data().smoke);
// smoke!.removeAt(0);
// }
//
// if (heat == null) {
// heat =
// List.filled(5, data.docs.first.data().heat, growable: true);
// } else {
// heat!.add(data.docs.first.data().heat);
// heat!.removeAt(0);
// }
//
// if (flame == null) {
// flame = List.filled(5, data.docs.first.data().flame,
// growable: true);
// } else {
// flame!.add(data.docs.first.data().flame);
// flame!.removeAt(0);
// }
//
// if (gas == null) {
// gas =
// List.filled(5, data.docs.first.data().gas, growable: true);
// } else {
// gas!.add(data.docs.first.data().gas);
// gas!.removeAt(0);
// }
//
// return
// Padding(
// padding: const EdgeInsets.all(24.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// Text(
// "Sensors Area",
// style: Theme
//     .of(context)
//     .textTheme
//     .titleMedium,
// textAlign: TextAlign.center,
// ),
// SizedBox(height: 32.h),
// Container(
// decoration: BoxDecoration(
// border: Border.symmetric(
// horizontal: BorderSide(
// width: 1.sp,
// color: lightGreyColor,
// ))),
// child: Padding(
// padding: const EdgeInsets.symmetric(vertical: 16),
// child: Row(
// children: [
// Column(
// children: [
// Row(
// children: [
//
// //TODO: this would be the realtime reads
//
// Text(
// // data.docs.first.data().heat.toString()
// "19"
// ,
// style: Theme
//     .of(context)
//     .textTheme
//     .titleLarge
//     ?.copyWith(fontWeight: FontWeight.w500),
// ),
// SizedBox(width: 8.w),
// Text(
// "\u2103",
// style: Theme
//     .of(context)
//     .textTheme
//     .titleLarge
//     ?.copyWith(fontWeight: FontWeight.w500),
// ),
// ],
// ),
// SizedBox(height: 8.h),
// Text("Normal dgree",
// style: Theme
//     .of(context)
//     .textTheme
//     .bodyMedium
//     ?.copyWith(color: yellowColor),)
// ],
// ),
// Spacer(),
// Icon(Icons.thermostat, color: Color(0xFF0E6912),
// size: 40.sp,)
// ],
// ),
// ),
// ),
// Container(
// // width: 311.41.w,
// // height: 72.h,
// decoration: BoxDecoration(
// border: Border.symmetric(
// horizontal: BorderSide(
// width: 1.sp,
// color: lightGreyColor,
// ))),
// child: Padding(
// padding: const EdgeInsets.symmetric(vertical: 16),
// child: Row(
// children: [
// Icon(Icons.warning_amber, size: 30.sp, color: Color(
// 0xFFECFF16),),
// SizedBox(width: 8.w,),
// Text(" Fire detected", style: Theme
//     .of(context)
//     .textTheme
//     .titleLarge
//     ?.copyWith(fontSize: 16)),
// Spacer(),
// Icon(Icons.local_fire_department, color: lightRedColor,
// size: 40.sp,)
// ],
// ),
// ),
// ),
// Container(
// // width: 311.41.w,
// // height: 72.h,
// decoration: BoxDecoration(
// border: Border.symmetric(
// horizontal: BorderSide(
// width: 1.sp,
// color: lightGreyColor,
// ))),
// child: Padding(
// padding: const EdgeInsets.symmetric(vertical: 16),
// child: Row(children: [
// Text("No Gas detected", style: Theme
//     .of(context)
//     .textTheme
//     .bodyMedium
//     ?.copyWith(color: yellowColor),),
// Spacer(),
// Icon(Icons.cloud_done, size: 40.sp, color: lightGreyColor,)
// ],),
// ),
// ),
// Container(
// // width: 311.41.w,
// // height: 72.h,
// decoration: BoxDecoration(
// border: Border.symmetric(
// horizontal: BorderSide(
// width: 1.sp,
// color: lightGreyColor,
// ))),
// child: Padding(
// padding: const EdgeInsets.symmetric(vertical: 16),
// child: Row(children: [
// Text("No Smoke detected", style: Theme
//     .of(context)
//     .textTheme
//     .bodyMedium
//     ?.copyWith(color: yellowColor),),
// Spacer(),
// Icon(Icons.smoke_free, size: 40.sp, color: lightGreyColor,)
// ],),
// ),
// ),
//
//
// ],
// ),
// );
// }
// ));
class SensorAreaScreen extends StatefulWidget {
  static const String routeName = 'SensorAreaScreen';

  const SensorAreaScreen({super.key});

  @override
  State<SensorAreaScreen> createState() => _SensorAreaScreenState();
}

class _SensorAreaScreenState extends State<SensorAreaScreen> {

  String? flame;
  String? heat;
  String? smoke;
  String? gas;

  static String collectionName = 'sensor';
  // final sensorRef = FirebaseFirestore.instance
  //     .collection(collectionName)
  //     .withConverter<SensorModel>(
  //   fromFirestore: (snapshots, _) => SensorModel.fromJson(snapshots.data()!),
  //   toFirestore: (movie, _) => movie.toJson(),
  // );
  DatabaseReference flameRef = FirebaseDatabase.instance.ref('sensor/irflame');
  DatabaseReference mq135Ref = FirebaseDatabase.instance.ref('sensor/mq135');
  DatabaseReference mq5Ref = FirebaseDatabase.instance.ref('sensor/mq5');
  DatabaseReference ds18b20Ref = FirebaseDatabase.instance.ref('sensor/ds18b20');

  @override
  Widget build(BuildContext context) {
    mq135Ref.onValue.listen((DatabaseEvent event) {final data = event.snapshot.value;heat=data.toString();setState(() {});});
    flameRef.onValue.listen((DatabaseEvent event) {final data = event.snapshot.value;flame=data.toString();setState(() {});});
    mq5Ref.onValue.listen((DatabaseEvent event) {final data = event.snapshot.value;smoke=data.toString();setState(() {});});
    ds18b20Ref.onValue.listen((DatabaseEvent event) {final data = event.snapshot.value;gas=data.toString();setState(() {});});
    // Stream<DatabaseEvent> stream = starCountRef.onValue;
    // stream.listen((DatabaseEvent event) {
    //   print('Event Type: ${event.type}'); // DatabaseEventType.value;
    //   print('Snapshot: ${event.snapshot}'); // DataSnapshot
    // });
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          Navigator.pushNamed(context, SideBarScreen.routeName);
        }, icon: Icon(Icons.arrow_forward_ios))],
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Sensors Area",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            Container(
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                        width: 1.sp,
                        color: lightGreyColor,
                      ))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [

                                  //TODO: this would be the realtime reads

                            Text(
                              heat.toString()
                              // "19"
                              ,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              "\u2103",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text("Normal dgree",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: yellowColor),)
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.thermostat,color: Color(0xFF0E6912),size: 40.sp,)
                  ],
                ),
              ),
            ),
            Container(
// width: 311.41.w,
// height: 72.h,
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                        width: 1.sp,
                        color: lightGreyColor,
                      ))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Icon(Icons.warning_amber,size: 30.sp,color: Color(0xFFECFF16),),
                    SizedBox(width: 8.w,),
                    Text(" Fire detected",style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16)),
                    Spacer(),
                    Icon(Icons.local_fire_department,color: lightRedColor,size: 40.sp,)
                  ],
                ),
              ),
            ),
            Container(
// width: 311.41.w,
// height: 72.h,
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                        width: 1.sp,
                        color: lightGreyColor,
                      ))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(children: [
                  Text("No Gas detected",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: yellowColor),),
                  Spacer(),
                  Icon(Icons.cloud_done,size: 40.sp,color: lightGreyColor,)
                ],),
              ),
            ),
            Container(
// width: 311.41.w,
// height: 72.h,
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                        width: 1.sp,
                        color: lightGreyColor,
                      ))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(children: [
                  Text("No Smoke detected",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: yellowColor),),
                  Spacer(),
                  Icon(Icons.smoke_free,size: 40.sp,color: lightGreyColor,)
                ],),
              ),
            ),



          ],
        ),
      ),
    );







  }
}

// Scaffold(
//       appBar: AppBar(
//         actions: [IconButton(onPressed: (){
//           Navigator.pushNamed(context, SideBarScreen.routeName);
//         }, icon: Icon(Icons.arrow_forward_ios))],
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//       ),
//       body: StreamBuilder<QuerySnapshot<SensorModel>>(
//         stream: sensorRef.snapshots(),
//     builder: (context, snapshot) {
//       // if (snapshot.hasError) {
//       //   return Center(
//       //   child: Text(snapshot.error.toString()),
//       // );
//       // }
//       //
//       // if (!snapshot.hasData) {
//       //   return const Center(child: CircularProgressIndicator());
//       // }
//       //
//       // final data = snapshot.requireData;
//       //
//       // if (tempList == null) {
//       // tempList = List.filled(5, data.docs.first.data().temperature,
//       // growable: true);
//       // } else {
//       // tempList!.add(data.docs.first.data().temperature);
//       // tempList!.removeAt(0);
//       // }
//       //
//       // if (rhList == null) {
//       // rhList =
//       // List.filled(5, data.docs.first.data().humidity, growable: true);
//       // } else {
//       // rhList!.add(data.docs.first.data().humidity);
//       // rhList!.removeAt(0);
//       // }
//
//       return
//         Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text(
//                 "Sensors Area",
//                 style: Theme
//                     .of(context)
//                     .textTheme
//                     .titleMedium,
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 32.h),
//               Container(
//                 decoration: BoxDecoration(
//                     border: Border.symmetric(
//                         horizontal: BorderSide(
//                           width: 1.sp,
//                           color: lightGreyColor,
//                         ))),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Row(
//                             children: [
//
//                               //TODO: this would be the realtime reads
//
//                               Text(
//                                 "19",
//                                 style: Theme
//                                     .of(context)
//                                     .textTheme
//                                     .titleLarge
//                                     ?.copyWith(fontWeight: FontWeight.w500),
//                               ),
//                               SizedBox(width: 8.w),
//                               Text(
//                                 "\u2103",
//                                 style: Theme
//                                     .of(context)
//                                     .textTheme
//                                     .titleLarge
//                                     ?.copyWith(fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 8.h),
//                           Text("Normal dgree",
//                             style: Theme
//                                 .of(context)
//                                 .textTheme
//                                 .bodyMedium
//                                 ?.copyWith(color: yellowColor),)
//                         ],
//                       ),
//                       Spacer(),
//                       Icon(Icons.thermostat, color: Color(0xFF0E6912),
//                         size: 40.sp,)
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 // width: 311.41.w,
//                 // height: 72.h,
//                 decoration: BoxDecoration(
//                     border: Border.symmetric(
//                         horizontal: BorderSide(
//                           width: 1.sp,
//                           color: lightGreyColor,
//                         ))),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   child: Row(
//                     children: [
//                       Icon(Icons.warning_amber, size: 30.sp, color: Color(
//                           0xFFECFF16),),
//                       SizedBox(width: 8.w,),
//                       Text(" Fire detected", style: Theme
//                           .of(context)
//                           .textTheme
//                           .titleLarge
//                           ?.copyWith(fontSize: 16)),
//                       Spacer(),
//                       Icon(Icons.local_fire_department, color: lightRedColor,
//                         size: 40.sp,)
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 // width: 311.41.w,
//                 // height: 72.h,
//                 decoration: BoxDecoration(
//                     border: Border.symmetric(
//                         horizontal: BorderSide(
//                           width: 1.sp,
//                           color: lightGreyColor,
//                         ))),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   child: Row(children: [
//                     Text("No Gas detected", style: Theme
//                         .of(context)
//                         .textTheme
//                         .bodyMedium
//                         ?.copyWith(color: yellowColor),),
//                     Spacer(),
//                     Icon(Icons.cloud_done, size: 40.sp, color: lightGreyColor,)
//                   ],),
//                 ),
//               ),
//               Container(
//                 // width: 311.41.w,
//                 // height: 72.h,
//                 decoration: BoxDecoration(
//                     border: Border.symmetric(
//                         horizontal: BorderSide(
//                           width: 1.sp,
//                           color: lightGreyColor,
//                         ))),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   child: Row(children: [
//                     Text("No Smoke detected", style: Theme
//                         .of(context)
//                         .textTheme
//                         .bodyMedium
//                         ?.copyWith(color: yellowColor),),
//                     Spacer(),
//                     Icon(Icons.smoke_free, size: 40.sp, color: lightGreyColor,)
//                   ],),
//                 ),
//               ),
//
//
//             ],
//           ),
//         );
//     }
//     ));
//
//
//
//
//
//
// Scaffold(
// appBar: AppBar(
// actions: [IconButton(onPressed: (){
// Navigator.pushNamed(context, SideBarScreen.routeName);
// }, icon: Icon(Icons.arrow_forward_ios))],
// centerTitle: true,
// backgroundColor: Colors.transparent,
// ),
// body: Padding(
// padding: const EdgeInsets.all(24.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// Text(
// "Sensors Area",
// style: Theme.of(context).textTheme.titleMedium,
// textAlign: TextAlign.center,
// ),
// SizedBox(height: 32.h),
// Container(
// decoration: BoxDecoration(
// border: Border.symmetric(
// horizontal: BorderSide(
// width: 1.sp,
// color: lightGreyColor,
// ))),
// child: Padding(
// padding: const EdgeInsets.symmetric(vertical: 16),
// child: Row(
// children: [
// Column(
// children: [
// Row(
// children: [
//
// //TODO: this would be the realtime reads
//
// Text(
// "19",
// style: Theme.of(context)
//     .textTheme
//     .titleLarge
//     ?.copyWith(fontWeight: FontWeight.w500),
// ),
// SizedBox(width: 8.w),
// Text(
// "\u2103",
// style: Theme.of(context)
//     .textTheme
//     .titleLarge
//     ?.copyWith(fontWeight: FontWeight.w500),
// ),
// ],
// ),
// SizedBox(height: 8.h),
// Text("Normal dgree",
// style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: yellowColor),)
// ],
// ),
// Spacer(),
// Icon(Icons.thermostat,color: Color(0xFF0E6912),size: 40.sp,)
// ],
// ),
// ),
// ),
// Container(
// // width: 311.41.w,
// // height: 72.h,
// decoration: BoxDecoration(
// border: Border.symmetric(
// horizontal: BorderSide(
// width: 1.sp,
// color: lightGreyColor,
// ))),
// child: Padding(
// padding: const EdgeInsets.symmetric(vertical: 16),
// child: Row(
// children: [
// Icon(Icons.warning_amber,size: 30.sp,color: Color(0xFFECFF16),),
// SizedBox(width: 8.w,),
// Text(" Fire detected",style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16)),
// Spacer(),
// Icon(Icons.local_fire_department,color: lightRedColor,size: 40.sp,)
// ],
// ),
// ),
// ),
// Container(
// // width: 311.41.w,
// // height: 72.h,
// decoration: BoxDecoration(
// border: Border.symmetric(
// horizontal: BorderSide(
// width: 1.sp,
// color: lightGreyColor,
// ))),
// child: Padding(
// padding: const EdgeInsets.symmetric(vertical: 16),
// child: Row(children: [
// Text("No Gas detected",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: yellowColor),),
// Spacer(),
// Icon(Icons.cloud_done,size: 40.sp,color: lightGreyColor,)
// ],),
// ),
// ),
// Container(
// // width: 311.41.w,
// // height: 72.h,
// decoration: BoxDecoration(
// border: Border.symmetric(
// horizontal: BorderSide(
// width: 1.sp,
// color: lightGreyColor,
// ))),
// child: Padding(
// padding: const EdgeInsets.symmetric(vertical: 16),
// child: Row(children: [
// Text("No Smoke detected",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: yellowColor),),
// Spacer(),
// Icon(Icons.smoke_free,size: 40.sp,color: lightGreyColor,)
// ],),
// ),
// ),
//
//
//
// ],
// ),
// ),
// );