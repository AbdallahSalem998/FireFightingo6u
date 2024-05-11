import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideBarScreen extends StatefulWidget {
  static const String routeName = 'SideBarScreen';
  const SideBarScreen({super.key});

  @override
  State<SideBarScreen> createState() => _SideBarScreenState();
}

class _SideBarScreenState extends State<SideBarScreen> {

  DatabaseReference ref = FirebaseDatabase.instance.ref("action");
  bool door = false,window = false,electricity = false,gas = false,alarm = false,water_pump=false;

  @override
  Widget build(BuildContext context) {
    Widget sideBarRow(IconData con, String text,Widget wid) {
      return Row(
        children: [
          Icon(con),
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20.sp,fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          wid
        ],
      );
    }

    // bool door = true,window = true,electricity = true,gas = true,alarm = true;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          sideBarRow(Icons.door_front_door, "Door", Switch(value: door, onChanged: (bool value) async {door=value; await ref.update({"door": door,});   setState(() {});})),
          sideBarRow(Icons.window, "Window", Switch(value: window, onChanged: (bool value) async {window=value; await ref.update({"window": window,});   setState(() {});})),
          sideBarRow(Icons.electric_bolt, "Electricity", Switch(value: electricity, onChanged: (bool value) async {electricity=value; await ref.update({"electricity ": electricity,});   setState((){});})),
          sideBarRow(Icons.cloud_done, "Gas", Switch(value: gas, onChanged: (bool value) async {gas=value; await ref.update({"gas": gas,});   setState((){});})),
          sideBarRow(CupertinoIcons.bell_fill, "Fire Alarm", Switch(value: alarm, onChanged: (bool value) async {alarm=value; await ref.update({"alarm": alarm,});   setState((){});})),
          sideBarRow(Icons.water_drop_outlined, "Water pump", Switch(value: water_pump, onChanged: (bool value) async {water_pump=value; await ref.update({"water_pump": water_pump,});   setState((){});})),
          // ElevatedButton(onPressed: () async {door= !door; await ref.update({"door": door,});}, child: Text("door")),
          // ElevatedButton(onPressed: () async {gas= !gas; await ref.update({"gas": gas,});}, child: Text("gas")),
          // ,Row(
          //   children: [
          //     Icon(Icons.door_front_door),
          //     Text(
          //       "Door",
          //        style: Theme.of(BuildContext as BuildContext).textTheme.titleMedium?.copyWith(fontSize: 20.sp,fontWeight: FontWeight.w500),
          //     ),
          //     Spacer(),
          //     Switch(
          //       value: true,
          //       onChanged: (value) {},
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}

// DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
//
// // Only update the name, leave the age and address!
// await ref.update({
// "age": 19,
// });
