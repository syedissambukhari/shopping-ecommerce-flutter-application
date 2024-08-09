import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping/View/userdashboard.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class payment extends StatelessWidget {
  const payment({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SlidingUpPanel(
          panel: LayoutBuilder(builder: (context, con) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "Add new card",
                    style: TextStyle(
                      fontSize: 20,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Name on card',
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Card number',
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
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Expiry date',
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
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'CVV',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: con.maxWidth,
                    height: con.maxHeight * 0.1,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Add card"),
                      style: ElevatedButton.styleFrom(),
                    ),
                  ),
                ],
              ),
            );
          }),

          // main body or content behind the panel
          body: LayoutBuilder(builder: (context, con) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back),
                      Text(
                        'Payment methods',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => userdashboard()));
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.05,
                  ),
                  Text(
                    ' Your payment methods',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.75,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            height: 50,
                            width: 50,
                            child: Image.asset('assets/plus.png')),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
