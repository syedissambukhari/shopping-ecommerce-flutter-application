import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../Controller/signupcontroller.dart';

class Signup extends GetView<signupcontroller> {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    Get.lazyPut<signupcontroller>(() => signupcontroller());
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(builder: (context, con) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.arrow_back),
                    ],
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.05,
                  ),
                  Text(
                    'Signup',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.1,
                  ),
                  Container(
                    height: 50,
                    width: con.maxWidth,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: controller.cone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Name',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.03,
                  ),
                  Container(
                    height: 50,
                    width: con.maxWidth,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: controller.ctwo,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.03,
                  ),
                  Container(
                    height: 50,
                    width: con.maxWidth,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: controller.cthree,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.takeme();
                        },
                        child: Text(
                          'Already have an accoount?',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.05,
                  ),
                  Container(
                    width: con.maxWidth,
                    height: con.maxHeight * 0.05,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          controller.create();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please fill the form')),
                          );
                        }
                      },
                      child: Text("Signup"),
                      style: ElevatedButton.styleFrom(),
                    ),
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.2,
                  ),
                  Center(
                    child: Text(
                      'Or login with a social account',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          child: Image.asset('assets/google.png')),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                          height: 50,
                          width: 50,
                          child: Image.asset('assets/facebook.png')),
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
