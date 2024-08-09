import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping/View/ass.dart';

class Women extends StatelessWidget {
  const Women({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('Women').snapshots(),
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
                                onTap: (() {
                                  String name = data['Name'];
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ass(text: name)));
                                }),
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
                                              width: con.maxWidth * 0.5,
                                              child: Image.network(
                                                data['path'],
                                                fit: BoxFit.contain,
                                              )),
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
