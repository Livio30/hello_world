import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:full_screen_image/full_screen_image.dart';

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
  Duration animationDelay = const Duration(milliseconds: 250);
  bool extendedConnected = false;
  // bool testFS = false;
  List<double> widgetHeight = [0.7, 0.3, 0.7, 0.3, 0.3, 0.7, 0.3, 0.7];
  List<double> widgetWidth = [
    0.325,
    0.325,
    0.325,
    0.325,
    0.325,
    0.325,
    0.325,
    0.325
  ];

  List<bool> widgetFS = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
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
                  onHorizontalDragEnd: (details) {
                    int sensi = 500;
                    double velocity = details.primaryVelocity!;
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
                  width: width * setColumnOneWidth(),
                  child: CarouselSlider(
                    items: [
                      Container(
                        height: height,
                        color: Colors.pink,
                        child: Column(
                          children: [
                            GestureDetector(
                              onDoubleTap: () {
                                setState(
                                  () {
                                    widgetFS[0] = !widgetFS[0];
                                    if (widgetFS[0] == true) {
                                      widgetHeight[0] = 1.0;
                                      widgetWidth[0] = 0.65;
                                      widgetHeight[1] = 0;
                                      extendedConnected = !extendedConnected;
                                    } else if (widgetFS[0] == false) {
                                      widgetHeight[0] = 0.7;
                                      widgetWidth[0] = 0.325;
                                      widgetHeight[1] = 0.3;
                                      extendedConnected = !extendedConnected;
                                    }
                                  },
                                );
                              },
                              onTap: () {
                                widgetOneLg = !widgetOneLg;
                                setState(() {
                                  widgetHeight[0] = widgetOneLg ? 0.7 : 0.3;
                                  widgetHeight[1] = widgetOneLg ? 0.3 : 0.7;
                                });
                              },
                              child: AnimatedContainer(
                                duration: animationDelay,
                                height: height * widgetHeight[0],
                                color: Colors.yellow,
                                child: Container(
                                  height: double.maxFinite,
                                  color: Colors.black,
                                  margin: const EdgeInsets.all(5),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onDoubleTap: () {
                                setState(
                                  () {
                                    widgetFS[1] = !widgetFS[1];
                                    if (widgetFS[1] == true) {
                                      widgetHeight[1] = 1.0;
                                      widgetWidth[1] = 0.65;
                                      widgetHeight[0] = 0;
                                      extendedConnected = !extendedConnected;
                                    } else if (widgetFS[1] == false) {
                                      widgetHeight[1] = 0.7;
                                      widgetWidth[1] = 0.325;
                                      widgetHeight[0] = 0.3;
                                      extendedConnected = !extendedConnected;
                                    }
                                  },
                                );
                              },
                              onTap: () {
                                widgetOneLg = !widgetOneLg;
                                setState(() {
                                  widgetHeight[1] = widgetOneLg ? 0.3 : 0.7;
                                  widgetHeight[0] = widgetOneLg ? 0.7 : 0.3;
                                });
                              },
                              child: AnimatedContainer(
                                duration: animationDelay,
                                height: height * widgetHeight[1],
                                color: Colors.cyan,
                                child: Container(
                                  color: Colors.black,
                                  margin: const EdgeInsets.all(5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
      
      // ==================== Column 1 Container 2 ====================
                      Container(
                        height: height,
                        color: Colors.blueGrey,
                        child: Column(
                          children: [
                            GestureDetector(
                              onDoubleTap: () {
                                setState(
                                  () {
                                    widgetFS[2] = !widgetFS[2];
                                    if (widgetFS[2] == true) {
                                      widgetHeight[2] = 1.0;
                                      widgetWidth[2] = 0.65;
                                      widgetHeight[3] = 0;
                                      extendedConnected = !extendedConnected;
                                    } else if (widgetFS[2] == false) {
                                      widgetHeight[2] = 0.7;
                                      widgetWidth[2] = 0.325;
                                      widgetHeight[3] = 0.3;
                                      extendedConnected = !extendedConnected;
                                    }
                                  },
                                );
                              },
                              onTap: () {
                                widgetTwoLg = !widgetTwoLg;
                                setState(() {
                                  widgetHeight[2] = widgetTwoLg ? 0.7 : 0.3;
                                  widgetHeight[3] = widgetTwoLg ? 0.3 : 0.7;
                                });
                              },
                              child: AnimatedContainer(
                                duration: animationDelay,
                                height: height * widgetHeight[2],
                                color: Colors.green,
                                child: Container(
                                  height: double.maxFinite,
                                  color: Colors.black,
                                  margin: const EdgeInsets.all(5),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onDoubleTap: () {
                                setState(
                                  () {
                                    widgetFS[3] = !widgetFS[3];
                                    if (widgetFS[3] == true) {
                                      widgetHeight[3] = 1.0;
                                      widgetWidth[3] = 0.65;
                                      widgetHeight[2] = 0;
                                      extendedConnected = !extendedConnected;
                                    } else if (widgetFS[3] == false) {
                                      widgetHeight[3] = 0.7;
                                      widgetWidth[3] = 0.325;
                                      widgetHeight[2] = 0.3;
                                      extendedConnected = !extendedConnected;
                                    }
                                  },
                                );
                              },
                              onTap: () {
                                widgetTwoLg = !widgetTwoLg;
                                setState(() {
                                  widgetHeight[3] = widgetTwoLg ? 0.3 : 0.7;
                                  widgetHeight[2] = widgetTwoLg ? 0.7 : 0.3;
                                });
                              },
                              child: AnimatedContainer(
                                duration: animationDelay,
                                height: height * widgetHeight[3],
                                color: Colors.indigo,
                                child: Container(
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
      // ==================== Column 2 ====================
                AnimatedContainer(
                  duration: animationDelay,
                  height: height,
                  width: width * setColumnTwoWidth(),
                  child: CarouselSlider(
                    items: [
                      Container(
                        height: height,
                        color: Colors.pink,
                        child: Column(
                          children: [
                            GestureDetector(
                              onDoubleTap: () {
                                setState(
                                  () {
                                    widgetFS[4] = !widgetFS[4];
                                    if (widgetFS[4] == true) {
                                      widgetHeight[4] = 1.0;
                                      widgetWidth[4] = 0.65;
                                      widgetHeight[5] = 0;
                                      extendedConnected = !extendedConnected;
                                    } else if (widgetFS[4] == false) {
                                      widgetHeight[4] = 0.7;
                                      widgetWidth[4] = 0.325;
                                      widgetHeight[5] = 0.3;
                                      extendedConnected = !extendedConnected;
                                    }
                                  },
                                );
                              },
                              onTap: () {
                                widgetThreeLg = !widgetThreeLg;
                                setState(() {
                                  widgetHeight[4] = widgetThreeLg ? 0.7 : 0.3;
                                  widgetHeight[5] = widgetThreeLg ? 0.3 : 0.7;
                                });
                              },
                              child: AnimatedContainer(
                                duration: animationDelay,
                                height: height * widgetHeight[4],
                                color: Colors.orange,
                                child: Container(
                                  height: double.maxFinite,
                                  color: Colors.black,
                                  margin: const EdgeInsets.all(5),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onDoubleTap: () {
                                setState(
                                  () {
                                    widgetFS[5] = !widgetFS[5];
                                    if (widgetFS[5] == true) {
                                      widgetHeight[5] = 1.0;
                                      widgetWidth[5] = 0.65;
                                      widgetHeight[4] = 0;
                                      extendedConnected = !extendedConnected;
                                    } else if (widgetFS[5] == false) {
                                      widgetHeight[5] = 0.7;
                                      widgetWidth[5] = 0.325;
                                      widgetHeight[4] = 0.3;
                                      extendedConnected = !extendedConnected;
                                    }
                                  },
                                );
                              },
                              onTap: () {
                                widgetThreeLg = !widgetThreeLg;
                                setState(() {
                                  widgetHeight[5] = widgetThreeLg ? 0.3 : 0.7;
                                  widgetHeight[4] = widgetThreeLg ? 0.7 : 0.3;
                                });
                              },
                              child: AnimatedContainer(
                                duration: animationDelay,
                                height: height * widgetHeight[5],
                                color: Colors.brown,
                                child: Container(
                                  color: Colors.black,
                                  margin: const EdgeInsets.all(5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
      
      // ==================== Column 2 Container 2 ====================
                      Container(
                        height: height,
                        color: Colors.blueGrey,
                        child: Column(
                          children: [
                            GestureDetector(
                              onDoubleTap: () {
                                setState(
                                  () {
                                    widgetFS[6] = !widgetFS[6];
                                    if (widgetFS[6] == true) {
                                      widgetHeight[6] = 1.0;
                                      widgetWidth[6] = 0.65;
                                      widgetHeight[7] = 0;
                                      extendedConnected = !extendedConnected;
                                    } else if (widgetFS[6] == false) {
                                      widgetHeight[6] = 0.7;
                                      widgetWidth[6] = 0.325;
                                      widgetHeight[7] = 0.3;
                                      extendedConnected = !extendedConnected;
                                    }
                                  },
                                );
                              },
                              onTap: () {
                                widgetFourLg = !widgetFourLg;
                                setState(() {
                                  widgetHeight[6] = widgetFourLg ? 0.7 : 0.3;
                                  widgetHeight[7] = widgetFourLg ? 0.3 : 0.7;
                                });
                              },
                              child: AnimatedContainer(
                                duration: animationDelay,
                                height: height * widgetHeight[6],
                                color: Colors.lightBlue,
                                child: Container(
                                  height: double.maxFinite,
                                  color: Colors.black,
                                  margin: const EdgeInsets.all(5),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onDoubleTap: () {
                                setState(
                                  () {
                                    widgetFS[7] = !widgetFS[7];
                                    if (widgetFS[7] == true) {
                                      widgetHeight[7] = 1.0;
                                      widgetWidth[7] = 0.65;
                                      widgetHeight[6] = 0;
                                      extendedConnected = !extendedConnected;
                                    } else if (widgetFS[7] == false) {
                                      widgetHeight[7] = 0.7;
                                      widgetWidth[7] = 0.325;
                                      widgetHeight[6] = 0.3;
                                      extendedConnected = !extendedConnected;
                                    }
                                  },
                                );
                              },
                              onTap: () {
                                widgetFourLg = !widgetFourLg;
                                setState(() {
                                  widgetHeight[7] = widgetFourLg ? 0.3 : 0.7;
                                  widgetHeight[6] = widgetFourLg ? 0.7 : 0.3;
                                });
                              },
                              child: AnimatedContainer(
                                duration: animationDelay,
                                height: height * widgetHeight[7],
                                color: Colors.deepPurple,
                                child: Container(
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

  double setColumnOneWidth() {
    if (widgetFS[0] || widgetFS[1] || widgetFS[2] || widgetFS[3]) {
      return 0.65;
    } else if (speedOFS ||
        widgetFS[4] ||
        widgetFS[5] ||
        widgetFS[6] ||
        widgetFS[7]) {
      return 0;
    } else
      return 0.325;
  }

  double setColumnTwoWidth() {
    if (widgetFS[4] || widgetFS[5] || widgetFS[6] || widgetFS[7]) {
      return 0.65;
    } else if (speedOFS ||
        widgetFS[0] ||
        widgetFS[1] ||
        widgetFS[2] ||
        widgetFS[3]) {
      return 0;
    } else
      return 0.325;
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
