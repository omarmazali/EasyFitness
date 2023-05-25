import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyfitness/body/create_workout/workoutCreationView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:provider/provider.dart';

import '../models/levels.dart';
import 'WorkoutPersonaleS.dart';
import 'populaireWorkoutCell.dart';
import '../headers/sectionHeader.dart';
import '../data/data.dart';

class Home extends StatefulWidget {
  final String name;

  Home({Key? key, required this.name});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    Provider.of<WorkoutData>(context, listen: false).initalizeWorkoutlist();
    Provider.of<WorkoutData>(context, listen: false).loadWorkoutsFromDb(); // Load workouts from the database
  }

  void CreatNewPersonelWorkout(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            WorkoutCreationView(),
      ),
    );
  }

  ProficiencyLevel _level = ProficiencyLevel.beginner;

  Widget _buildSegmentedControl() {
    return Container(
      width: double.infinity,
      child: MaterialSegmentedControl(
        children: {
          ProficiencyLevel.beginner.index: Text('Beginner'),
          ProficiencyLevel.intermediate.index: Text(
            'Intermediate',
          ),
          ProficiencyLevel.advanced.index: Text('Advanced')
        },
        selectionIndex: _level.index,
        borderColor: Colors.grey[900],
        selectedColor: Colors.lightGreenAccent,
        unselectedColor: Colors.grey[800],
        selectedTextStyle: TextStyle(color: Colors.black, fontSize: 10),
        unselectedTextStyle: TextStyle(color: Colors.white, fontSize: 10),
        borderWidth: 0.1,
        borderRadius: 20,
        onSegmentTapped: (index) {
          setState(() {
            _level = ProficiencyLevel.values[index];
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget segmentedControl = _buildSegmentedControl();

    return Consumer<WorkoutData>(
      builder: (context, value, child) =>
          Scaffold(
            backgroundColor: Colors.grey[900],
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.lightGreenAccent,
              onPressed: () => CreatNewPersonelWorkout(context),
              child: Icon(Icons.add, color: Colors.white),
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 5, top: 50, bottom: 20),
                  child: Row(
                    children: [
                      //header
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'HELLO ${widget.name.toUpperCase()},',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Let's train",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 26.0,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //populaire workouts

                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 5),
                  child: Column(
                    children: [
                      SectionHeader(
                        title: "Workout Categories",
                        actionTitle: "See all",
                        action: () {},
                      ),
                      segmentedControl,
                      SizedBox(
                        height: 15,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: value.getWorkoutlist().map((workout) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: PopulaireWorkout(workout: workout),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),

                //my workouts
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 5),
                    child: Column(
                      children: [
                        SectionHeader(
                            title: "Personal Workouts", actionTitle: "See all"),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height - 550,
                          child: ListView.builder(
                            itemCount: value
                                .getWorkoutlist()
                                .length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final workout = value.getWorkoutlist()[index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8),
                                child: PersonnalWorkoutCell(
                                  workout: workout,
                                  numberOfExercises:
                                  value.numberOfExercicesInWorkout(
                                      workout.name),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
    );
  }
}

class HomePreviews extends StatefulWidget {
  @override
  State<HomePreviews> createState() => _HomePreviewsState();
}

class _HomePreviewsState extends State<HomePreviews> {
  final userId = FirebaseAuth.instance.currentUser?.uid;
  String firstName = '';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      final usersRef = _firestore.collection('Users');
      final querySnapshot =
      await usersRef.where('userId', isEqualTo: userId).get();

      if (querySnapshot.size > 0) {
        final documentSnapshot = querySnapshot.docs.first;
        final data = documentSnapshot.data();

        setState(() {
          firstName = data['first name'] ?? '';
        });

        print('First Name: $firstName');
      } else {
        print('User document not found!');
      }
    } catch (e) {
      print('Error fetching user profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Home(
      name: firstName,
    );
  }
}
