import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool widgetOneLg = true;
  bool widgetTwoLg = true;
  bool widgetThreeLg = false;
  bool widgetFourLg = false;
  bool speedOFS = false;
  Duration animationDelay = const Duration(milliseconds: 300);
  bool extendedConnected = false;
  // bool testFS = false;
  List<double> widgetHeight= [0.7,0.3,0.7,0.3,0.7,0.3,0.7,0.3];
  List<double> widgetWidth= [0.325,0.325,0.325,0.325,0.325,0.325,0.325,0.325];

  // List<bool> widgetFS = [
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  // ];
  // void setWidth(int widgetId){

  // }

  // int getWidgetIndex() {
  //   int index = 0;
  //   int count = 0;
  //   for (count = 0; count < widgetFS.length; count++) {
  //     if (widgetFS[count]) {
  //       index = count;
  //       print("index : $index");
  //       return index;
  //     }
  //   }
  //   print("List $widgetFS");
  //   // if (count < widgetFS.length) return true;
  //   return -1;
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 36;
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Row(
              children: [
                GestureDetector(
                  // onTap: () => print("Return: ${getWidgetIndex()}"),
                  onHorizontalDragEnd: (details) {
                    int sensi = 500;
                    double velocity = details.primaryVelocity!;
                    print(velocity);
                    if (velocity > sensi) {
                      setState(() => speedOFS = true);
                    } else if (velocity < -sensi) {
                      setState(() => speedOFS = false);
                    }
                  },
                  child: AnimatedContainer(
                    duration: animationDelay,
                    color: Colors.red,
                    height: height,
                    width: width * (speedOFS ? 1.0 : 0.35),
                    child: Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      color: Colors.black,
                      margin: const EdgeInsets.all(5),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: animationDelay,
                  height: height,
                  // width: speedOFS
                  //     ? (width * (speedOFS ? 0.0 : 0.325))
                  //     : (widgetFS[0] ? width * 0.65 : width * 0.325),
                  width:  widgetWidth[0] * width,
                  child: CarouselSlider(
                    items: [
                      Container(
                        height: height,
                        color: Colors.pink,
                        // width: widgetFS[0]?500:double.maxFinite,
                        // margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            GestureDetector(
                              onDoubleTap: () {
                                setState(() {
                                  // widgetFS.fillRange(0, widgetFS.length, false);
                                  widgetHeight[0] = 1;
                                  widgetWidth[0] = 0.65;
                                  widgetHeight[1] =0;
                                  extendedConnected = !extendedConnected;
                                });
                              },
                              onTap: () =>
                                  setState(() => widgetOneLg = !widgetOneLg),
                              child: AnimatedContainer(
                                duration: animationDelay,
                                // width: double.maxFinite,
                                // height: height * (widgetOneLg ? 0.7 : 0.3),
                                height: height * widgetHeight[0],
                                // height: widgetFS[1]
                                //     ? (widgetFS[1] ? 0 : height)
                                //     : (height * (widgetOneLg ? 0.7 : 0.3)),
                                color: Colors.yellow,
                                child: Container(
                                  // width: double.maxFinite,
                                  height: double.maxFinite,
                                  color: Colors.black,
                                  margin: const EdgeInsets.all(5),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onDoubleTap: () {
                                setState(() {
                                  // widgetFS.fillRange(0, widgetFS.length, false);
                                  // extendedConnected = !extendedConnected;
                                  // widgetFS[1] = !widgetFS[1];
                                });
                              },
                              onTap: () {
                                setState(() => widgetOneLg = !widgetOneLg);
                                print(widgetOneLg);
                              },
                              child: AnimatedContainer(
                                duration: animationDelay,
                                // height:testFS?(testFS? 0.0:height):(),
                                // height: height * (widgetOneLg ? 0.3 : 0.7),
                                // height: widgetFS[0]
                                //     ? (widgetFS[0] ? 0 : height * 0.3)
                                //     : (widgetOneLg ? height * 0.3 : height * 0.7),
                                // height: widgetOneLg
                                //     ? (widgetOneLg ? height * 0.3 : height * 0.7)
                                //     : (testFS ? 0.0 : height * 0.7),
                                color: Colors.cyan,
                                child: Container(
                                  width: double.maxFinite,
                                  // height:testFS? double.maxFinite:0,
                                  color: Colors.black,
                                  margin: const EdgeInsets.all(5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // width: width * 0.3,
                        height: height,
                        color: Colors.deepPurple,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  setState(() => widgetTwoLg = !widgetTwoLg),
                              child: AnimatedContainer(
                                duration: animationDelay,
                                width: double.maxFinite,
                                height: height * (widgetTwoLg ? 0.7 : 0.3),
                                color: Colors.indigo,
                                child: Container(
                                  width: double.maxFinite,
                                  height: double.maxFinite,
                                  color: Colors.black,
                                  margin: const EdgeInsets.all(5),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  setState(() => widgetTwoLg = !widgetTwoLg),
                              child: AnimatedContainer(
                                duration: animationDelay,
                                width: double.maxFinite,
                                height: height * (widgetTwoLg ? 0.3 : 0.7),
                                color: Colors.orange,
                                child: Container(
                                  width: double.maxFinite,
                                  height: double.maxFinite,
                                  color: Colors.black,
                                  margin: const EdgeInsets.all(5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                        height: height,
                        scrollDirection: Axis.vertical,
                        viewportFraction: 1.0,
                        scrollPhysics: extendedConnected
                            ? NeverScrollableScrollPhysics()
                            : AlwaysScrollableScrollPhysics()),
                  ),
                ),
                AnimatedContainer(
                  duration: animationDelay,
                  width: 0,

                  // width: speedOFS
                  //     ? (width * (speedOFS ? 0.0 : 0.325))
                  //     : (widgetFS[0] ||widgetFS[1] ? width * 0.0 : width * 0.325),
                  height: height,
                  child: CarouselSlider(
                    items: [
                      Container(
                        // width: width * 0.3,
                        height: height,
                        color: Colors.blue,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  setState(() => widgetThreeLg = !widgetThreeLg),
                              child: AnimatedContainer(
                                duration: animationDelay,
                                // width: double.maxFinite,
                                height: height * (widgetThreeLg ? 0.7 : 0.3),
                                color: Colors.amber,
                                child: Container(
                                  // width: width*0.325,
                                  height: double.maxFinite,
                                  color: Colors.black,
                                  margin: const EdgeInsets.all(5),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  setState(() => widgetThreeLg = !widgetThreeLg),
                              child: AnimatedContainer(
                                duration: animationDelay,
                                width: double.maxFinite,
                                height: height * (widgetThreeLg ? 0.3 : 0.7),
                                color: Colors.lightGreen,
                                child: Container(
                                  width: double.maxFinite,
                                  height: double.maxFinite,
                                  color: Colors.black,
                                  margin: const EdgeInsets.all(5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // width: width * 0.3,
                        height: height,
                        color: Colors.deepPurple,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  setState(() => widgetFourLg = !widgetFourLg),
                              child: AnimatedContainer(
                                duration: animationDelay,
                                width: double.maxFinite,
                                height: height * (widgetFourLg ? 0.7 : 0.3),
                                color: Colors.blueGrey,
                                child: Container(
                                  width: double.maxFinite,
                                  height: double.maxFinite,
                                  color: Colors.black,
                                  margin: const EdgeInsets.all(5),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  setState(() => widgetFourLg = !widgetFourLg),
                              child: AnimatedContainer(
                                duration: animationDelay,
                                width: double.maxFinite,
                                height: height * (widgetFourLg ? 0.3 : 0.7),
                                color: Colors.lime,
                                child: Container(
                                  width: double.maxFinite,
                                  height: double.maxFinite,
                                  color: Colors.black,
                                  margin: const EdgeInsets.all(5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                        height: height,
                        scrollDirection: Axis.vertical,
                        viewportFraction: 1.0,
                        scrollPhysics: extendedConnected
                            ? NeverScrollableScrollPhysics()
                            : AlwaysScrollableScrollPhysics()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // double setWidth() {
  //   if (speedOFS) {
  //     return 0;
  //   } else if (widgetFS[0] || widgetFS[1]) {
  //     return 0.65;
  //   } else {
  //     return 0.325;
  //   }
  // }

  // // height: widgetFS[1]? (widgetFS[1] ? 0: height) : (height * (widgetOneLg ? 0.7 : 0.3)),
  // double setHeight() {
  //   int index = getWidgetIndex();
  //   if (index == 0) {
  //     if (widgetFS[index] == true) return 1;
  //   }
  //   else if (widgetOneLg == true) return 0.7;
  //   else if(widgetOneLg == false) return 0.3;
  //   else if(index == 0 && widgetFS[1] == true) return 0;
  //   return 0;
  // }
}
