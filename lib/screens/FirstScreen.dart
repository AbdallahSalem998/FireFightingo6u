import 'package:firefightingsystem/screens/NoDangerScreen.dart';
import 'package:firefightingsystem/shared/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstScreen extends StatelessWidget {
  static const String routeName = 'FirstScreen';

  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Smart Detector",
      //       style: Theme.of(context).textTheme.titleMedium),
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      // ),
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          Navigator.pushNamed(context, NoDangerScreen.routeName);
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
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            "Check your house and make sure to stay safe. ",
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 32.h,
          ),
          Image.asset(
            "assets/images/alertdanger.png",
            height: 160.h,
            width: 160.w,
          ),
          SizedBox(
            height: 48.h,
          ),
          Container(
            width: 282.w,
            height: 48.h,
            decoration: BoxDecoration(border: Border.all(width: 1,color: greyColor,)),
            child: Center(child: Text("Smoke detected!",style: Theme.of(context).textTheme.titleLarge,)),
          ),
          SizedBox(
            height: 32.h,
          ),
          Container(
            width: 282.w,
            height: 48.h,
            decoration: BoxDecoration(border: Border.all(width: 1,color: greyColor,)),
            child: Center(child: Text("Fire detected!",style: Theme.of(context).textTheme.titleLarge,)),
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Column(
          //       children: [
          //         Image.asset(
          //           "assets/images/phoneicon.png",
          //           width: 24.w,
          //           height: 24.h,
          //         ),
          //         Text(
          //           "call 122",
          //           style: Theme.of(context).textTheme.titleSmall,
          //         )
          //       ],
          //     ),
          //     SizedBox(
          //       width: 96.w,
          //     ),
          //     Column(
          //       children: [
          //         Image.asset(
          //           "assets/images/WhatToDo.png",
          //           width: 24.w,
          //           height: 24.h,
          //         ),
          //         Text(
          //           "What to do?",
          //           style: Theme.of(context).textTheme.titleSmall,
          //         )
          //       ],
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 24.h,
          // ),
          // Image.asset(
          //   "assets/images/MuteBotton.png",
          //   width: 355.w,
          //   height: 69.h,
          // )
        ],
    ),
      ),

    );
  }
}
