import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firefightingsystem/providers/my_provider.dart';
import 'package:firefightingsystem/screens/LoginScreen.dart';
import 'package:firefightingsystem/screens/SensorAreaScreen.dart';
import 'package:firefightingsystem/shared/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

String? flame;
String? heat;
String? smoke;
String? gas;
double Doubleflame=0;
double Doubleheat=0;
double Doublesmoke=0;
double Doublegas=0;

Future<AudioPlayer> playLocalAsset() async {
  AudioCache cache = new AudioCache();
  //At the next line, DO NOT pass the entire reference such as assets/yes.mp3. This will not work.
  //Just pass the file name only.
  //TODO change the path after i find a good alert sound and may make a for loop for it if it's short one
  return await cache.play("mixkitelectricfencealert2969.wav");
}
Future<AudioPlayer> playLocalAsset2() async {
  AudioCache cache = new AudioCache();
  //At the next line, DO NOT pass the entire reference such as assets/yes.mp3. This will not work.
  //Just pass the file name only.
  //TODO change the path after i find a good alert sound and may make a for loop for it if it's short one
  return await cache.play("mixkit-mechanical-alert-769.wav");
}
void toDouble() {
  Doubleflame=double.parse(flame.toString());
  Doubleheat=double.parse(heat.toString());
  Doublesmoke=double.parse(smoke.toString());
  Doublegas=double.parse(gas.toString());
}
void alarmCheck(){}

DatabaseReference flameRef = FirebaseDatabase.instance.ref('sensor/irflame');
DatabaseReference mq135Ref = FirebaseDatabase.instance.ref('sensor/mq135');
DatabaseReference mq5Ref = FirebaseDatabase.instance.ref('sensor/mq5');
DatabaseReference ds18b20Ref = FirebaseDatabase.instance.ref('sensor/ds18b20');

class NoDangerScreen extends StatefulWidget {
  static const String routeName = 'NoDangerScreen';

  const NoDangerScreen({super.key});

  @override
  State<NoDangerScreen> createState() => _NoDangerScreenState();
}

int dangerstate=0;
int FlameDangerState=0;
int HeatDangerState=0;
int SmokeDangerState=0;
int GasDangerState=0;
String imgsource = "assets/images/nodanger.png";
String TextFlame="";
String TextHeat="";
String TextSmoke="";
String TextGas="";
String dangerText = "Everything is OK";
String AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";


class _NoDangerScreenState extends State<NoDangerScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    // void alarmCheck() {
    //   if(Doubleflame>=20){
    //     playLocalAsset();
    //     dangerstate=true;
    //     imgsource="assets/images/alertdanger.png";
    //     dangerText = "Danger Found !!";
    //     TextFlame="\nFlame Found !!";
    //     AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
    //     setState(() {});
    //     // Navigator.pushReplacementNamed(context, FirstScreen.routeName);
    //   }
    //   else if(Doubleheat>=20){
    //     playLocalAsset();
    //     dangerstate=true;
    //     imgsource="assets/images/alertdanger.png";
    //     dangerText = "Danger Found !!";
    //     TextHeat="\nOverHeat Found !!";
    //     AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
    //     setState(() {});
    //     // Navigator.pushReplacementNamed(context, FirstScreen.routeName);
    //   }
    //   else if(Doublesmoke>=20){
    //     playLocalAsset();
    //     dangerstate=true;
    //     imgsource="assets/images/alertdanger.png";
    //     dangerText = "Danger Found !!";
    //     TextSmoke="\nSmoke Found !!";
    //     AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
    //     setState(() {});
    //     // Navigator.pushReplacementNamed(context, FirstScreen.routeName);
    //   }
    //   else if(Doublegas>=20){
    //     playLocalAsset();
    //     dangerstate=true;
    //     imgsource="assets/images/alertdanger.png";
    //     dangerText = "Danger Found !!";
    //     TextGas="\nGas Found !!";
    //     AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
    //     setState(() {});
    //     // Navigator.pushReplacementNamed(context, FirstScreen.routeName);
    //   }
    //   else{
    //     dangerstate=false;
    //     imgsource = "assets/images/nodanger.png";
    //     dangerText = "Everything is OK";
    //     TextFlame="";
    //     TextHeat="";
    //     TextSmoke="";
    //     TextGas="";
    //     AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
    //   }
    // }
    void alarmCheck() {
      if(FlameDangerState==2||HeatDangerState==2||SmokeDangerState==2||GasDangerState==2){
        dangerstate=2;
      }
      else if(FlameDangerState==1||HeatDangerState==1||SmokeDangerState==1||GasDangerState==1){
        if(FlameDangerState==2||HeatDangerState==2||SmokeDangerState==2||GasDangerState==2){
          dangerstate=2;
        }else{dangerstate=1;}
      }
      else if(FlameDangerState==0&&HeatDangerState==0&&SmokeDangerState==0&&GasDangerState==0){
        dangerstate=0;
      }
    }
    void DangerCheck(){
      alarmCheck();
      if(dangerstate==1){
        playLocalAsset2();
        imgsource="assets/images/istockphoto-1165690157-612x612.jpg";
        dangerText = "Attention Needed !";
      }
      else if(dangerstate==2){
        playLocalAsset();
        imgsource="assets/images/alertdanger.png";
        dangerText = "Danger Found !!";
      }
      else if(dangerstate==0){
        imgsource = "assets/images/nodanger.png";
        dangerText = "Everything is OK";
      }
    }
    void FlameAlarmCheck() {
      if(Doubleflame==1){
        // playLocalAsset();
        FlameDangerState=2;
        DangerCheck();
        TextFlame="\nFlame Found !!";
        AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
        setState(() {});
      }
      else if(Doubleflame==0){
        FlameDangerState=0;
        DangerCheck();
        TextFlame="";
        AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
        setState(() {});
      }
      // else{
      //   dangerstate=false;
      //   imgsource = "assets/images/nodanger.png";
      //   dangerText = "Everything is OK";
      //   TextSmoke="";
      //   AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
      // }
    }
    void HeatAlarmCheck() {
      if(Doubleheat>=60&&Doubleheat<80){
        HeatDangerState=1;
        DangerCheck();
        TextHeat="\nHeat Found !!";
        AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
        setState(() {});
      }
      else if(Doubleheat>=80){
        // playLocalAsset();
        HeatDangerState=2;
        DangerCheck();
        TextHeat="\nHeat Found !!";
        AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
        setState(() {});
      }
      else if(Doubleheat<60){
        HeatDangerState=0;
        DangerCheck();
        TextHeat="";
        AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
        setState(() {});
      }
      // else{
      //   dangerstate=false;
      //   imgsource = "assets/images/nodanger.png";
      //   dangerText = "Everything is OK";
      //   TextGas="";
      //   AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
      // }
    }
    void SmokeAlarmCheck() {
      if(Doublesmoke>=2&&Doublesmoke<4){
        SmokeDangerState=1;
        DangerCheck();
        TextSmoke="\nSmoke Found !!";
        AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
        setState(() {});
      }
      else if(Doublesmoke<2){
        // playLocalAsset();
        SmokeDangerState=2;
        DangerCheck();
        TextSmoke="\nSmoke Found !!";
        AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
        setState(() {});
      }
      else if(Doublesmoke>4){
        SmokeDangerState=0;
        DangerCheck();
        TextSmoke="";
        AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
        setState(() {});
      }
      // else{
      //   dangerstate=false;
      //   imgsource = "assets/images/nodanger.png";
      //   dangerText = "Everything is OK";
      //   TextSmoke="";
      //   AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
      // }
    }
    void GasAlarmCheck() {
      if(Doublegas>=2&&Doublegas<4){
        GasDangerState=1;
        DangerCheck();
        TextGas="\nGas Found !!";
        AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
        setState(() {});
      }
      else if(Doublegas<2){
        // playLocalAsset();
        GasDangerState=2;
        DangerCheck();
        TextGas="\nGas Found !!";
        AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
        setState(() {});
      }
      else if(Doublegas>4){
        GasDangerState=0;
        DangerCheck();
        TextGas="";
        AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
        setState(() {});
      }
      // else{
      //   dangerstate=false;
      //   imgsource = "assets/images/nodanger.png";
      //   dangerText = "Everything is OK";
      //   TextGas="";
      //   AlertText = "$dangerText$TextFlame$TextSmoke$TextGas$TextHeat";
      // }
    }

    mq135Ref.onValue.listen((DatabaseEvent event) {final data = event.snapshot.value;smoke=data.toString();toDouble();SmokeAlarmCheck();});
    flameRef.onValue.listen((DatabaseEvent event) {final data = event.snapshot.value;flame=data.toString();toDouble();FlameAlarmCheck();});
    mq5Ref.onValue.listen((DatabaseEvent event) {final data = event.snapshot.value;gas=data.toString();toDouble();GasAlarmCheck();});
    ds18b20Ref.onValue.listen((DatabaseEvent event) {final data = event.snapshot.value;heat=data.toString();toDouble();HeatAlarmCheck();});


    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              provider.signOut();
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            )),
        ],
      ),
      // appBar: AppBar(
      //   actions: [IconButton(onPressed: (){
      //     Navigator.pushNamed(context, SensorAreaScreen.routeName);
      //   }, icon: Icon(Icons.arrow_forward_ios))],
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      // ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Smart Detector",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              AlertText,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color:dangerstate==2?Colors.red:dangerstate==1?Colors.orange:yellowColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8.h,
            ),
            // Text(
            //   "No Problems Found",
            //   style: Theme.of(context).textTheme.titleSmall,
            //   textAlign: TextAlign.center,
            // ),
            SizedBox(
              height: 76.h,
            ),
            Image.asset(
              imgsource,
              height: 160.h,
              width: 160.w,
            ),
            SizedBox(height: 200.h,),
            InkWell(
              onTap: () {Navigator.pushNamed(context, SensorAreaScreen.routeName);},
              child: Container(
                // margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: dangerstate==2?Colors.red:dangerstate==1?Colors.orange:yellowColor,
                      border: Border.symmetric(
                        vertical: BorderSide(
                          width: 6.sp,
                          color: lightGreyColor,),
                          horizontal: BorderSide(
                    width: 6.sp,
                    color: lightGreyColor,
                  ))),
                child: Text("First Floor", style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color:Colors.black,fontSize: 45.sp),
                textAlign: TextAlign.center,),),
            ),
            // SizedBox(
            //   height: 219.h,
            // ),
            // Container(
            //   width: 311.41.w,
            //   height: 46.h,
            //   decoration: BoxDecoration(
            //       border: Border.symmetric(
            //           horizontal: BorderSide(
            //     width: 1.sp,
            //     color: lightGreyColor,
            //   ))),
            //   child: Row(
            //     children: [
            //       Icon(CupertinoIcons.battery_0,color: LimeColor),
            //       SizedBox(
            //         width: 8.w,
            //       ),
            //       Text(
            //         "Battery full",
            //         style: Theme.of(context).textTheme.titleSmall,
            //       ),
            //       Spacer(),
            //       IconButton(onPressed: () {}, icon: Icon(Icons.info_outline))
            //     ],
            //   ),
            // ),
            // Container(
            //   width: 311.41.w,
            //   height: 46.h,
            //   decoration: BoxDecoration(
            //       border: Border.symmetric(
            //           horizontal: BorderSide(
            //     width: 1.sp,
            //     color: lightGreyColor,
            //   ))),
            //   child: Row(
            //     children: [
            //       Icon(Icons.sensors_outlined,color: LimeColor,),
            //       SizedBox(
            //         width: 8.w,
            //       ),
            //       Text(
            //         "Sensor working",
            //         style: Theme.of(context).textTheme.titleSmall,
            //       ),
            //       Spacer(),
            //       IconButton(onPressed: () {}, icon: Icon(Icons.info_outline))
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
