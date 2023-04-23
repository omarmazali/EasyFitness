import 'package:easyfitness/screens/login_signup.dart';
import 'package:flutter/material.dart';
import 'package:scale_ruler_view/scale_ruler_view.dart';

class Weight extends StatefulWidget {
  @override
  _WeightState createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Text(
              "WHAT'S YOUR WEIGHT?",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
              child: Text(
                "YOU CAN ALWAYS CHANGE THIS LATER",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 140,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 193,
                      ),
                      Text(
                        "kg",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Center(
                        child: Container(
                      color: Colors.grey[900],
                      child: RulerWidget(
                        size: Size(size.width, size.height * 0.2),
                        viewStyle: ViewStyle.valueUpScaleDownCloseStyle,
                        showHighScaleLine: true,
                        showHighScaleNum: true,
                        showLowScaleLine: true,
                        showLowScaleNum: true,
                        showMiddleScaleLine: true,
                        showMiddleScaleNum: true,
                        showLine: false,
                        textSize: 0,
                        zoomTextSize: 50,
                        startValue: 10,
                        endValue: 200,
                        initValue: 50,
                        space: 10,
                        scaleValueSpace: 10,
                        lowScaleLineColor: Colors.lightGreenAccent,
                        middleScaleLineColor: Colors.lightGreenAccent,
                        highScaleLineColor: Colors.lightGreenAccent,
                        lineColor: Colors.white,
                        lowScaleLineHigh: 20,
                        middleScaleLineHigh: 35,
                        highScaleLineHigh: 60,
                        middleScaleLineStrokeWidth: 2,
                        lowScaleLineStrokeWidth: 2,
                        highScaleLineStrokeWidth: 2,
                        lineStrokeWidth: 2,
                        textColor: Colors.white,
                        middleSpaceValueSpace: 5,
                        highSpaceValeSpace: 10,
                        callback: (int value) {
                          debugPrint("scaleValueChange  ${value}");
                        },
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 30,),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: FloatingActionButton(
                          onPressed: (){
                            Navigator.of(context).pushReplacementNamed('Age');
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 25,
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.grey[800],
                        ),
                      ),
                      SizedBox(
                        width: 180,
                      ),
                      SizedBox(
                        height: 46,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              backgroundColor: Colors.lightGreenAccent,
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('Height');
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Next",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  size: 30.0,
                                  color: Colors.black,
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
