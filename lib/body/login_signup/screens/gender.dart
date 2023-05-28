import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String gender = "";

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateGender(String gender) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      final usersRef = _firestore.collection('Users');
      final querySnapshot = await usersRef.where('userId', isEqualTo: userId).get();

      if (querySnapshot.size > 0) {
        final documentSnapshot = querySnapshot.docs.first;
        final documentRef = _firestore.doc(documentSnapshot.reference.path);

        await documentRef.update({
          'gender': gender,
        });

        print('Gender updated successfully!');
      } else {
        print('User document not found!');
      }
    } catch (e) {
      print('Error updating gender: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Text(
                "TELL US ABOUT YOURSELF!",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
                child: Text(
                  "TO GIVE YOU A BETTER EXPERIENCE WE NEED TO KNOW YOUR GENDER",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                      gender = 'Male';
                      updateGender(gender);
                  });
                },
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: gender == 'Male'
                        ? Colors.lightGreenAccent
                        : Colors.grey[800],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: Icon(
                            Icons.male,
                            size: 70.0,
                            color: gender == 'Male'
                                ? Colors.grey[900]
                                : Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Male",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: gender == 'Male'
                                ? Colors.grey[900]
                                : Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                      gender = 'Female';
                      updateGender(gender);
                  });
                },
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: gender == 'Female'
                        ? Colors.lightGreenAccent
                        : Colors.grey[800],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: Icon(
                            Icons.female,
                            size: 70.0,
                            color: gender == 'Female'
                                ? Colors.grey[900]
                                : Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Female",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: gender == 'Female'
                                ? Colors.grey[900]
                                : Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 270,
                  ),
                  SizedBox(
                    height: 46,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Colors.lightGreenAccent,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('Age');
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
