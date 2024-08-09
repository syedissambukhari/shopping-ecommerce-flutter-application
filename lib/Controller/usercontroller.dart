import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shopping/View/payment.dart';

class usercontroller extends GetxController {
  String? downloadURL;

  void handleClick(int item) {
    switch (item) {
      case 1:
        Get.to(payment());
    }
  }

  Future getData() async {
    try {
      await downloadURLExample();
      return downloadURL;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }

  Future<void> downloadURLExample() async {
    downloadURL =
        await FirebaseStorage.instance.ref().child("shop.jpg").getDownloadURL();
    debugPrint(downloadURL.toString());
  }
}
