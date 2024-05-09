import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firefightingsystem/models/user_model.dart';
import 'package:flutter/material.dart';


class FirebaseFunctions {

  static Future<UserModel?> readUser(String id) async {
    DocumentSnapshot<UserModel> userQuery =
    await getUsersCollection().doc(id).get();
    UserModel? userModel = userQuery.data();
    return userModel;
  }


  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.COLLECTION_NAME)
        .withConverter<UserModel>(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }


  // static Future<void> addUserToFirestore(UserModel user) {
  //   var collection = getUsersCollection();
  //   var docRef = collection.doc(user.id);
  //   return docRef.set(user);
  // }
  //
  //
  // static void createAuthAccount(String name, String age, String email,
  //     String password, Function afterAddToFirestore) async {
  //   try {
  //     var credential =
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     UserModel user = UserModel(
  //       id: credential.user!.uid,
  //       name: name,
  //       email: email,
  //       age: age,
  //     );
  //     addUserToFirestore(user).then((value) {
  //       afterAddToFirestore();
  //       // Navigator.pushReplacementNamed(context, routeName);
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       print('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       print('The account already exists for that email.');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  static void userLogin(String emailAddress, String password,
      Function userNotFound, Function getUser) async {
    try {
      var credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      readUser(credential.user!.uid).then((value) {
        getUser(value);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        userNotFound();
      } else if (e.code == 'wrong-password') {
        userNotFound();
      }
    }
  }
}
