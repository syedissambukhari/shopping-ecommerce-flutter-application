import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/View/Login.dart';
import 'package:shopping/View/payment.dart';

class signupcontroller extends GetxController {
  TextEditingController cone = TextEditingController();
  TextEditingController ctwo = TextEditingController();
  TextEditingController cthree = TextEditingController();
  Future<void> create() async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: ctwo.text.toString().trim(),
              password: cthree.text.toString().trim());
      String? user = FirebaseAuth.instance.currentUser?.uid;
      FirebaseFirestore.instance.collection('Data').doc(user).set({
        'Name': cone.text,
        'Email': ctwo.text,
        'Password': cthree.text,
      });
      Get.to(payment());
      cone.clear();
      ctwo.clear();
      cthree.clear();
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        e.code,
        e.code,
        icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    } catch (e) {
      print(e);
    }
  }

  void takeme() {
    Get.to(Login());
  }
}
