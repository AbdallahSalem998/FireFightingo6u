import 'package:firefightingsystem/screens/SensorAreaScreen.dart';
import 'package:firefightingsystem/shared/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoDangerScreen extends StatelessWidget {
  static const String routeName = 'NoDangerScreen';

  const NoDangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          Navigator.pushNamed(context, SensorAreaScreen.routeName);
        }, icon: Icon(Icons.arrow_forward_ios))],
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
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
              "Everything is OK",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: yellowColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "No Problems Found",
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 76.h,
            ),
            Image.asset(
              "assets/images/nodanger.png",
              height: 160.h,
              width: 160.w,
            ),
            SizedBox(
              height: 219.h,
            ),
            Container(
              width: 311.41.w,
              height: 46.h,
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                width: 1.sp,
                color: lightGreyColor,
              ))),
              child: Row(
                children: [
                  Icon(CupertinoIcons.battery_0,color: LimeColor),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "Battery full",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.info_outline))
                ],
              ),
            ),
            Container(
              width: 311.41.w,
              height: 46.h,
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                width: 1.sp,
                color: lightGreyColor,
              ))),
              child: Row(
                children: [
                  Icon(Icons.sensors_outlined,color: LimeColor,),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "Sensor working",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.info_outline))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
