import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/utils/constant.dart';
import 'package:flutter_tutorial/widgets/transaction.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMyColor,
        title: Text('Flutter Tutorial'),
        leading: Icon(Icons.abc),
        actions: [
          Icon(Icons.add),
          Icon(Icons.remove),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(seconds: 1),
                builder: ((context, value, child) {
                  return Transform.translate(
                    offset: Offset(0.0, value * 10),
                    child: Opacity(
                      opacity: value,
                      child: Container(
                        width: size.width,
                        height: 300,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                offset: Offset(1, 5),
                                blurRadius: 3,
                                spreadRadius: 0.3,
                              ),
                            ]),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 20,
              ),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(seconds: 1),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0.0, value * 10),
                    child: Opacity(
                      opacity: value,
                      child: Container(
                        width: size.width,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                offset: Offset(1, 5),
                                blurRadius: 3,
                                spreadRadius: 0.3,
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              myContainer(
                                value: 'Box 1',
                                color: Colors.blueAccent,
                              ),
                              myContainer(
                                value: 'Box 2',
                                color: Colors.red,
                              ),
                              myContainer(
                                value: 'Box 3',
                                color: Colors.pink,
                              ),
                              myContainer(
                                value: 'Box 4',
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 300),
                  builder: (context, value, _) {
                    return Transform.translate(
                      offset: Offset(0.0, value * 10),
                      child: Opacity(
                        opacity: value,
                        child: Container(
                          width: size.width,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                offset: Offset(1, 5),
                                blurRadius: 3,
                                spreadRadius: 0.3,
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                // head
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Opacity(
                                        opacity: value,
                                        child: Text(
                                          'Transaction',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      AnimatedContainer(
                                        duration: const Duration(milliseconds: 300),
                                        width: lerpDouble(0, 100, value),
                                        height: lerpDouble(0, 30, value),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.blue),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50),
                                              topRight: Radius.circular(50),
                                              bottomLeft: Radius.circular(50),
                                              bottomRight: Radius.circular(50),
                                            )),
                                        child: Center(
                                          child: Text('More'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // body
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Transaction(
                                        text: 'Json',
                                        color: Colors.blue,
                                      ),
                                      Transaction(
                                        text: 'Json',
                                        color: Colors.redAccent,
                                      ),
                                      Transaction(
                                        text: 'Json',
                                        color: Colors.deepPurple,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget myContainer({required Color color, required String value}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text('${value}'),
      ],
    );
  }
}
