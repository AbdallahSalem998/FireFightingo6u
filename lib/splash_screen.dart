import 'dart:async';
import 'package:firefightingsystem/providers/my_provider.dart';
import 'package:firefightingsystem/screens/FirstScreen.dart';
import 'package:firefightingsystem/screens/LoginScreen.dart';
import 'package:firefightingsystem/shared/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class SplashScreen2Sub extends StatefulWidget {
  static const String routeName = 'splash';
  @override
  _SplashScreen2SubState createState() => _SplashScreen2SubState();
}

class _SplashScreen2SubState extends State<SplashScreen2Sub> {
  bool _a = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        _a = !_a;
      });
    });
    Timer(Duration(milliseconds: 4000), () {
      var provider = Provider.of<MyProvider>(context,listen: false);
      Navigator.of(context).pushReplacement(SlideTransitionAnimation(provider.firebaseUser==null?LoginScreen():FirstScreen()));
      // Navigator.of(context).pushReplacement(SlideTransitionAnimation(FirstScreen()));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn,
            width: _a ? _width : 0,
            height: _height,
            color: darkBlueColor,
          ),
          Center(
            child: Image.asset('assets/images/splashscreen.png',
            width: 179.82.w,
            height: 116.h,
              fit: BoxFit.fill,
            )
          ),
        ],
      ),
    );
  }
}

class SlideTransitionAnimation extends PageRouteBuilder {
  final Widget page;

  SlideTransitionAnimation(this.page)
      : super(
      pageBuilder: (context, animation, anotherAnimation) => page,
      transitionDuration: Duration(milliseconds: 2000),
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation = CurvedAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          parent: animation,
        );
        return SlideTransition(
          position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
              .animate(animation),
          textDirection: TextDirection.rtl,
          child: page,
        );
      });
}

