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

    bool door = true,window = true,electricity = true,gas = true,alarm = true;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          sideBarRow(Icons.door_front_door, "Door", Switch(value: door, onChanged: (bool value){setState(() {door=value; });})),
          sideBarRow(Icons.window, "Window", Switch(value: window, onChanged: (bool value){setState(() {window=value; });})),
          sideBarRow(Icons.electric_bolt, "Electricity", Switch(value: electricity, onChanged: (bool value){setState(() {electricity=value; });})),
          sideBarRow(Icons.cloud_done, "Gas", Switch(value: gas, onChanged: (bool value){setState(() {gas=value; });})),
          sideBarRow(CupertinoIcons.bell_fill, "Fire Alarm", Switch(value: alarm, onChanged: (bool value){setState(() {alarm=value; });})),
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
