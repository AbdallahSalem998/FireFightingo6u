import 'package:firefightingsystem/screens/FirstScreen.dart';
import 'package:firefightingsystem/screens/NoDangerScreen.dart';
import 'package:firefightingsystem/screens/SensorAreaScreen.dart';
import 'package:firefightingsystem/screens/SensorAreaScreen.dart';
import 'package:firefightingsystem/screens/SidebarScreen.dart';
import 'package:firefightingsystem/shared/styles/my_theme.dart';
import 'package:firefightingsystem/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
            theme: MyThemeData.lightTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen2Sub.routeName,
            routes: {
              FirstScreen.routeName: (context) => FirstScreen(),
              SplashScreen2Sub.routeName: (_) => SplashScreen2Sub(),
              NoDangerScreen.routeName: (_) => NoDangerScreen(),
              SensorAreaScreen.routeName: (_) => SensorAreaScreen(),
              SideBarScreen.routeName: (_) => SideBarScreen(),
            }
        );
      },
    );
  }
}
