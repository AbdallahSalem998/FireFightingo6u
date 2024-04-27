import 'package:firebase_auth/firebase_auth.dart';
import 'package:firefightingsystem/firebase_functions.dart';
import 'package:firefightingsystem/models/user_model.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {

  UserModel? myUser;
  User? firebaseUser;
  String languageCode = "en";
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode mode){
    themeMode=mode;
    notifyListeners();
  }

  void changeLanguage (String lang){
    languageCode=lang;
    notifyListeners();
  }
  MyProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initUser();
    }
  }

  void initUser() async {
    firebaseUser = FirebaseAuth.instance.currentUser;
    myUser = await FirebaseFunctions.readUser(firebaseUser!.uid);
    notifyListeners();
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
