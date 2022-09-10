import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool up = false;
  double opacity = 1.0;
  DragStartDetails? startDetails;
  DragUpdateDetails? updateDetails;

  AnimationController? _controllerA;

  Widget animationContainer(
      double translateY, double translateX, int angle, int duration) {
    return AnimatedContainer(
      duration: Duration(milliseconds: duration),
      transform: Transform.translate(
        offset: Offset(up == true ? translateX : 0,
            up == true ? translateY : 0), // Change -100 for the y offset
      ).transform,
      child: AnimatedContainer(
        padding: const EdgeInsets.all(10.0),
        duration: Duration(milliseconds: duration), // Animation speed
        transform: Transform.rotate(
                alignment: Alignment.topRight, angle: up == true ? -pi/angle : 0)
            .transform,

        child: Transform.scale(
          scale: 1 - _controllerA!.value,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 10.0,
                ),
              ],
            ),
            height: 150.0,
            width: 100,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  colorContainer(20, Colors.red),
                  const SizedBox(
                    height: 5,
                  ),
                  colorContainer(40, Colors.blue),
                  const SizedBox(
                    height: 5,
                  ),
                  colorContainer(50, Colors.yellow),
                  const SizedBox(
                    height: 20,
                  ),
                  colorContainer(20, Colors.red),
                  const SizedBox(
                    height: 5,
                  ),
                  colorContainer(40, Colors.blue),
                  const SizedBox(
                    height: 5,
                  ),
                  colorContainer(50, Colors.yellow),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget colorContainer(double width, Color color) {
    return Container(
      height: 10,
      width: width,
      color: color.withOpacity(opacity),
    );
  }

  @override
  void initState() {
    _controllerA = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerA!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // List<Widget> anim =[
    //   animationContainer(height - 190,width-(width*0.8-(width*(1-(width / (height / 1.2))))/3),5,200),
    //   animationContainer(height - 190,width-(width*0.8-(width*(1-(width / (height / 1.2))))/3)-30-(width*(1-(width / (height / 1.2)))),6,230),
    //   animationContainer(height - 190,width-(width*0.8-(width*(1-(width / (height / 1.2))))/3)-40-(width*(1-(width / (height / 1.2))))-20-(width*(1-(width / (height / 1.2)))),7,260),
    //   animationContainer(height - 380,width-(width*0.8-(width*(1-(width / (height / 1.2))))/3),8,290),
    //   animationContainer(height - 380,width-(width*0.8-(width*(1-(width / (height / 1.2))))/3)-30-(width*(1-(width / (height / 1.2)))),9,320),
    //   animationContainer(height - 380,width-(width*0.8-(width*(1-(width / (height / 1.2))))/3)-40-(width*(1-(width / (height / 1.2))))-20-(width*(1-(width / (height / 1.2)))),10,350),
    //
    // ];

    List<Widget> anim = [
      animationContainer(
          height - (height * 0.53 - (width * (1 - (width / (height / 1.2))))),
          width - (width * 0.89 - (width * (1 - (width / (height / 1.2)))) / 3),
          5,
          200),
      animationContainer(
          height - (height * 0.53 - (width * (1 - (width / (height / 1.2))))),
          width -
              (width * 0.72 - (width * (1 - (width / (height / 1.2)))) / 3) -
              30 -
              (width * (1 - (width / (height / 1.2)))),
          6,
          220),
      animationContainer(
          height - (height * 0.53 - (width * (1 - (width / (height / 1.2))))),
          width -
              (width * 0.55 - (width * (1 - (width / (height / 1.2)))) / 3) -
              40 -
              (width * (1 - (width / (height / 1.2)))) -
              20 -
              (width * (1 - (width / (height / 1.2)))),
          7,
          240),
      animationContainer(
          height - (height * 0.79 - (width * (1 - (width / (height / 1.2))))),
          width - (width * 0.89 - (width * (1 - (width / (height / 1.2)))) / 3),
          8,
          260),
      animationContainer(
          height - (height * 0.79 - (width * (1 - (width / (height / 1.2))))),
          width -
              (width * 0.72 - (width * (1 - (width / (height / 1.2)))) / 3) -
              30 -
              (width * (1 - (width / (height / 1.2)))),
          9,
          280),
      animationContainer(
          height - (height * 0.79 - (width * (1 - (width / (height / 1.2))))),
          width -
              (width * 0.55 - (width * (1 - (width / (height / 1.2)))) / 3) -
              40 -
              (width * (1 - (width / (height / 1.2)))) -
              20 -
              (width * (1 - (width / (height / 1.2)))),
          10,
          300),
    ];
    return GestureDetector(
      onVerticalDragStart: (dragDetails) {
        startDetails =dragDetails;
      },
      onVerticalDragUpdate: (dragDetails){
        updateDetails = dragDetails;
      },
      onVerticalDragEnd: (endDetails){
        double dx = updateDetails!.globalPosition.dx-startDetails!.globalPosition.dx;
        double dy = updateDetails!.globalPosition.dy-startDetails!.globalPosition.dy;
        double? velocity = endDetails.primaryVelocity;
        if(dx<8){
          dx=-dx;

        }
        if(dy<8) {
          dy = -dy;
        }
        if(velocity! >0){
          setState(() {
            up = !up;
            if (opacity == 1) {
              opacity = 0.5;
            } else {
              opacity = 1;
            }
          });
        }else if(velocity <0){
          setState(() {
            up = !up;
            if (opacity == 1) {
              opacity = 0.5;
            } else {
              opacity = 1;
            }
          });
        }

      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 8.0, right: 8.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: width / (height / 1.2),
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return anim[index];
                  },
                  itemCount: 6,
                ),
              ),
              AnimatedContainer(
                transform: Transform.translate(
                  offset: Offset(
                      0, up == true ? 20 : 0), // Change -100 for the y offset
                ).transform,
                duration: Duration(milliseconds: 250),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: GestureDetector(
                    // onTapDown: (tapDown) {
                    //   _controllerA!.forward();
                    // // },
                    // onTapUp: (tapUp) {
                    //   _controllerA!.reverse();
                    // },
                    onTap: () {
                      setState(() {
                        up = !up;
                        if (opacity == 1) {
                          opacity = 0.5;
                        } else {
                          opacity = 1;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      height: 150.0,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            colorContainer(20, Colors.red),
                            const SizedBox(
                              height: 5,
                            ),
                            colorContainer(40, Colors.blue),
                            const SizedBox(
                              height: 5,
                            ),
                            colorContainer(50, Colors.yellow),
                            const SizedBox(
                              height: 20,
                            ),
                            colorContainer(20, Colors.red),
                            const SizedBox(
                              height: 5,
                            ),
                            colorContainer(40, Colors.blue),
                            const SizedBox(
                              height: 5,
                            ),
                            colorContainer(50, Colors.yellow),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
