import 'package:firefightingsystem/firebase_functions.dart';
import 'package:firefightingsystem/providers/my_provider.dart';
import 'package:firefightingsystem/screens/FirstScreen.dart';
import 'package:firefightingsystem/shared/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'LoginScreen';

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [SizedBox(height: 50.h,),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            //   children: [
            //     Text(
            //       "Welcome to Firo",
            //       style: Theme.of(context)
            //           .textTheme
            //           .titleMedium
            //           ?.copyWith(fontSize: 32.sp),
            //     ),
            //     SizedBox(
            //       height: 32.h,
            //     ),
            //     Center(
            //       child: Text(
            //         "Please sign in to continue",
            //         style: Theme.of(context)
            //             .textTheme
            //             .titleMedium
            //             ?.copyWith(color: BlackColor),
            //       ),
            //     ),
            //
            //   ],
            // ),
            Text(
              "Welcome to Firo",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 32.sp),
            ),
            SizedBox(
              height: 32.h,
            ),
            Center(
              child: Text(
                "Please sign in to continue",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: BlackColor),
              ),
            ),
            SizedBox(height: 120.h,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
               TextFormField(
              controller: usernameController,
              validator: (value) {
                bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value!);
                if (value == null || value.isEmpty) {
                  return "Please enter Username";
                } else if (!emailValid) {
                  return 'Please enter valid email';
                }

                return null;
              },
              decoration: InputDecoration(
                  label: Text("Email"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide:
                      BorderSide(color: darkBlueColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide:
                      BorderSide(color: darkBlueColor))),
              ),
               SizedBox(
              height: 20.h,
              ),
               TextFormField(
              obscureText: true,
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter password";
                } else if (value.length < 6) {
                  return ' please enter at least 6 char';
                }
                return null;
              },
              decoration: InputDecoration(
                  label: Text("Password"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide:
                      BorderSide(color: darkBlueColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide:
                      BorderSide(color: darkBlueColor))),
              ),
               SizedBox(
              height: 20.h,
              ),
               ElevatedButton(
              onPressed: () {
                // Navigator.pushReplacementNamed(
                //     context, FirstScreen.routeName);
                if (formKey.currentState!.validate()) {
                  FirebaseFunctions.userLogin(
                      usernameController.text,
                      passwordController.text, () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) =>
                          AlertDialog(
                            title: Text("Error"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Ok"))
                            ],
                            content: Text("Wrong Username or password"),
                          ),
                    );
                  }, (usermodel)
                  {
                        // Duration(milliseconds: 3000);
                    provider.initUser();
                        // Duration(milliseconds: 3000);
                    Navigator.pushReplacementNamed(
                        context, FirstScreen.routeName,
                        arguments: usermodel);
                  });
                }
              },
              child: Text("Login"),
              ),
          ],
        ),
            ),


      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: [
      //     Text(
      //       "Welcome to Firo",
      //       style: Theme.of(context)
      //           .textTheme
      //           .titleMedium
      //           ?.copyWith(fontSize: 32.sp),
      //     ),
      //     SizedBox(
      //       height: 32.h,
      //     ),
      //     Center(
      //       child: Text(
      //         "Please sign in to continue",
      //         style: Theme.of(context)
      //             .textTheme
      //             .titleMedium
      //             ?.copyWith(color: BlackColor),
      //       ),
      //     ),
      //
      //   ],
      // ),


  ]
    )
      )
    );
  }
}


//                   Row(
//                     children: [
//                       Text(
//                         "Don't have an account?",
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodyMedium!
//                             .copyWith(color: Colors.black54, fontSize: 12),
//                       ),
//                       SizedBox(
//                         width: 6,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.pushReplacementNamed(
//                               context, SignUpScreen.routeName);
//                         },
//                         child: Text(
//                           "Create Account",
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyMedium!
//                               .copyWith(fontSize: 13),
//                         ),
//                       )////////////////////////////////////////

