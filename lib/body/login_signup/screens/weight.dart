import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scale_ruler_view/scale_ruler_view.dart';

class Weight extends StatefulWidget {
  @override
  _WeightState createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int _selectedWeight = 50;

  Future<void> updateWeight(int weight) async {
    try {
      final userId = _auth.currentUser?.uid;
      final usersRef = _firestore.collection('Users');
      final querySnapshot = await usersRef.where('userId', isEqualTo: userId).get();

      if (querySnapshot.size > 0) {
        final documentSnapshot = querySnapshot.docs.first;
        final documentRef = _firestore.doc(documentSnapshot.reference.path);

        final ageFromFirestore = documentSnapshot.data()['age'] ?? 0;
        final int ageInt = int.tryParse(ageFromFirestore) ?? 0;

        final heightFromFirestore = documentSnapshot.data()['height'] ?? 0;
        final int heightInt = int.tryParse(heightFromFirestore) ?? 0;

        final isMale = documentSnapshot.data()['isMale'] ?? true;

        final double bmi = calculateBMI(weight, heightInt);

        final double bmr = calculateBMR(weight, heightInt, ageInt, isMale);

        await documentRef.update({
          'weight': weight,
          'bmi': bmi,
          'bmr' : bmr,
        });
      } else {
        print('User document not found!');
      }
    } catch (e) {
      print('Error updating weight: $e');
    }
  }


  double calculateBMR(int weight, int height, int age, bool isMale) {
    double bmr = 0.0;
    if (isMale) {
      bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }
    return bmr;
  }


  double calculateBMI(int weight, int height) {
    double heightInMeters = height / 100.0;
    double bmi = weight / (heightInMeters * heightInMeters);

    return bmi;
  }

  Widget buildRulerWidget(Size size) {
    return RulerWidget(
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
        setState(() {
          _selectedWeight = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 70),
            Text(
              "WHAT'S YOUR WEIGHT?",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
              child: Text(
                "YOU CAN ALWAYS CHANGE THIS LATER",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 140),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Row(
                    children: [
                      SizedBox(width: 193),
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
                        child: buildRulerWidget(size),
                      ),
                    ),
                  ),
                  SizedBox(height: 150),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('Height');
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 25,
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.grey[800],
                        ),
                      ),
                      SizedBox(width: 180),
                      SizedBox(
                        height: 46,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Colors.lightGreenAccent,
                          ),
                          onPressed: () async {
                            updateWeight(_selectedWeight);
                            Navigator.of(context).pushReplacementNamed('Level');
                          },
                          child: Row(
                            children: [
                              SizedBox(width: 20),
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
                          ),
                        ),
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
