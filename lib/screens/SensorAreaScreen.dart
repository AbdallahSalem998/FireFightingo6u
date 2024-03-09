import 'package:firefightingsystem/screens/SidebarScreen.dart';
import 'package:firefightingsystem/shared/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SensorAreaScreen extends StatelessWidget {
  static const String routeName = 'SensorAreaScreen';

  const SensorAreaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          Navigator.pushNamed(context, SideBarScreen.routeName);
        }, icon: Icon(Icons.arrow_forward_ios))],
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),      body: Padding(
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
                            Text(
                              "19",
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
