import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:shopping/Controller/usercontroller.dart';
import 'package:shopping/View/Women.dart';
import 'package:shopping/View/cart.dart';

class userdashboard extends GetView<usercontroller> {
  const userdashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<usercontroller>(() => usercontroller());
    return WillPopScope(
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                PopupMenuButton<int>(
                  onSelected: (item) => controller.handleClick(item),
                  itemBuilder: (context) => [
                    PopupMenuItem<int>(
                        value: 1, child: Text('Payment methods')),
                  ],
                ),
              ],
              backgroundColor: Colors.teal,
              title: Text(
                'Categories',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              centerTitle: true,
              bottom: const TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'Store',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Cart',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                Women(),
                cart(),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: Text("Confirm Exit"),
                content: Text("Are you sure you want to exit?"),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text("YES"),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                  ElevatedButton(
                    child: Text("NO"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
        return Future.value(true);
      },
    );
  }
}
