import 'package:firebase_database/firebase_database.dart';
import 'package:firefightingsystem/shared/styles/app_colors.dart';
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
    Widget sideBarRow(Widget w,String text,Widget wid) {
      return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r),color: darkBlueColor),
        child: Row(
          children: [
            w,
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20.sp,fontWeight: FontWeight.w500,color: Colors.white),
            ),
            const Spacer(),
            wid
          ],
        ),
      );
    }

    // bool door = true,window = true,electricity = true,gas = true,alarm = true;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              sideBarRow(door?Image.asset('assets/images/door_OPEN.png', width: 40, height: 40, fit: BoxFit.cover,):Image.asset('assets/images/door_CLOSED.png', width: 40, height: 40, fit: BoxFit.cover,) , "Door", Switch(value: door,inactiveTrackColor: Colors.redAccent,inactiveThumbColor: Colors.red,activeColor: Colors.green, onChanged: (bool value) async {door=value; await ref.update({"door": door,});   setState(() {});})),
              SizedBox(height: 18.h,),
              sideBarRow(window?Image.asset('assets/images/window_OPEN.png', width: 40, height: 40, fit: BoxFit.cover,):Image.asset('assets/images/window_CLOSED.png', width: 40, height: 40, fit: BoxFit.cover,)  , "Window", Switch(value: window,inactiveTrackColor: Colors.redAccent,inactiveThumbColor: Colors.red,activeColor: Colors.green, onChanged: (bool value) async {window=value; await ref.update({"window": window,});   setState(() {});})),
              SizedBox(height: 18.h,),
              sideBarRow(electricity?Image.asset('assets/images/electricity_ON.png', width: 40, height: 40, fit: BoxFit.cover,):Image.asset('assets/images/electricity_OFF.png', width: 40, height: 40, fit: BoxFit.cover,) , "Electricity", Switch(value: electricity,inactiveTrackColor: Colors.redAccent,inactiveThumbColor: Colors.red,activeColor: Colors.green, onChanged: (bool value) async {electricity=value; await ref.update({"electricity ": electricity,});   setState((){});})),
              SizedBox(height: 18.h,),
              sideBarRow(gas?Image.asset('assets/images/gas_WHITE.png', width: 40, height: 40, fit: BoxFit.cover,):Image.asset('assets/images/gas_ON.png', width: 40, height: 40, fit: BoxFit.cover,) , "Gas", Switch(value: gas,inactiveTrackColor: Colors.redAccent,inactiveThumbColor: Colors.red,activeColor: Colors.green, onChanged: (bool value) async {gas=value; await ref.update({"gas": gas,});   setState((){});})),
              SizedBox(height: 18.h,),
              sideBarRow(alarm?Image.asset('assets/images/alarm_ON.png', width: 40, height: 40, fit: BoxFit.cover,):Image.asset('assets/images/alarm_OFF.png', width: 40, height: 40, fit: BoxFit.cover,)  , "Fire Alarm", Switch(value: alarm,inactiveTrackColor: Colors.redAccent,inactiveThumbColor: Colors.red,activeColor: Colors.green, onChanged: (bool value) async {alarm=value; await ref.update({"alarm": alarm,});   setState((){});})),
              SizedBox(height: 18.h,),
              sideBarRow(water_pump?Image.asset('assets/images/water_ON.png', width: 40, height: 40, fit: BoxFit.cover,):Image.asset('assets/images/water_OFF.png', width: 40, height: 40, fit: BoxFit.cover,)  , "Water pump", Switch(value: water_pump,inactiveTrackColor: Colors.redAccent,inactiveThumbColor: Colors.red,activeColor: Colors.green, onChanged: (bool value) async {water_pump=value; await ref.update({"water_pump": water_pump,});   setState((){});})),
            ],
          ),
            // Spacer(),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 10.h),
            //   child: Container(alignment: Alignment.bottomRight,child: Image.asset("assets/images/firefighter.jpg",height: 250.h,width: 250.w,)),
            // )
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
