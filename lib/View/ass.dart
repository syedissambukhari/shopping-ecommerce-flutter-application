import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ass extends StatelessWidget {
  final String text;
  ass({required this.text});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Double tap on item to add to cart',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Women')
                    .doc(text)
                    .collection('images')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return new Text("Loading");
                  }

                  return ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        Map<String, dynamic> data =
                            snapshot.data!.docs[index].data();
                        return Column(
                          children: [
                            LayoutBuilder(builder: (context, con) {
                              return GestureDetector(
                                onDoubleTap: () {
                                  String name = data['Name'];
                                  String price = data['Price'];

                                  try {
                                    const snackdemo = SnackBar(
                                      content: Text(
                                          'Item has been added to cart successfully'),
                                      backgroundColor: Colors.green,
                                      elevation: 10,
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(5),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackdemo);
                                    String? user =
                                        FirebaseAuth.instance.currentUser?.uid;
                                    FirebaseFirestore.instance
                                        .collection('Cart')
                                        .doc(user)
                                        .collection('Orders')
                                        .doc()
                                        .set({
                                      'Name': name,
                                      'Price': price,
                                    });
                                  } on FirebaseAuthException catch (e) {
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 238, 229, 228),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: 160,
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              data['Name'],
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Container(
                                              height: 200,
                                              width: con.maxWidth * 0.3,
                                              child: Image.network(
                                                data['path'],
                                                fit: BoxFit.contain,
                                              )),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text('Price=' + data['Price']),
                                        ],
                                      ),
                                    )),
                              );
                            }),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        );
                      });
                }),
          ),
        ],
      ),
    ));
  }
}
