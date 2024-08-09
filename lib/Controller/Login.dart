import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shopping/View/Signup.dart';
import 'package:shopping/View/payment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/View/userdashboard.dart';

class logincontroller extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  void taketoad() {}

  Future signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: controller1.text, password: controller2.text);
      Get.to(userdashboard());
      controller1.clear();
      controller2.clear();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs?.setBool("isLoggedIn", true);

      return;
    } on FirebaseAuthException catch (e) {
      return Get.snackbar(
        e.code,
        e.code,
        icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    }
  }

  void clickme() {
    // ignore: prefer_const_constructors
    Get.to(Signup());
  }
}
