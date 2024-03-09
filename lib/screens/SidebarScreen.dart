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

    bool b1 = true;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          sideBarRow(Icons.door_front_door, "Door", Switch(value: b1, onChanged: (bool value){setState(() {b1=value;});})),
          sideBarRow(Icons.window, "Window", Switch(value: b1, onChanged: (bool value){setState(() {b1=value;});})),
          sideBarRow(Icons.electric_bolt, "Electricity", Switch(value: b1, onChanged: (bool value){setState(() {b1=value;});})),
          sideBarRow(Icons.cloud_done, "Gas", Switch(value: b1, onChanged: (bool value){setState(() {b1=value;});})),
          sideBarRow(CupertinoIcons.bell_fill, "Fire Alarm", Switch(value: b1, onChanged: (bool value){setState(() {b1=value;});})),
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

