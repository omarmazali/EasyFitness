import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyfitness/body/home/screens/populaireWorkoutCell.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:provider/provider.dart';

import '../../create_workout/workoutCreationView.dart';
import '../data/data.dart';
import '../data/popularWorkoutData.dart';
import '../headers/sectionHeader.dart';
import '../models/levels.dart';
import 'WorkoutPersonaleS.dart';


class Home extends StatefulWidget {
  final String name;


  Home({Key? key, required this.name});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late WorkoutData workoutData;
  late PopularWorkoutData popularWorkoutData;
  ProficiencyLevel _level = ProficiencyLevel.beginner;

  @override
  void initState() {
    super.initState();
    workoutData = Provider.of<WorkoutData>(context, listen: false);
    popularWorkoutData = Provider.of<PopularWorkoutData>(context, listen: false);
    workoutData.initalizeWorkoutlist();
    workoutData.loadWorkoutsFromDb();
  }

  void CreatNewPersonelWorkout(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => WorkoutCreationView(),
      ),
    );
  }

  Widget _buildSegmentedControl() {
    return Container(
      width: double.infinity,
      child: MaterialSegmentedControl(
        children: {
          ProficiencyLevel.beginner.index: Text('Beginner', style: TextStyle(fontSize: 12),),
          ProficiencyLevel.intermediate.index: Text('Intermediate', style: TextStyle(fontSize: 12)),
          ProficiencyLevel.advanced.index: Text('Advanced', style: TextStyle(fontSize: 12)),
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

    return ChangeNotifierProvider<PopularWorkoutData>(
      create: (context) => popularWorkoutData,
      child: ChangeNotifierProvider<WorkoutData>(
        create: (context) => workoutData,
        child: Consumer2<WorkoutData, PopularWorkoutData>(
          builder: (context, workoutData, popularWorkoutData, child) => Scaffold(
            backgroundColor: Colors.grey[900],
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.lightGreenAccent,
              onPressed: () => CreatNewPersonelWorkout(context),
              child: Icon(Icons.add, color: Colors.white),
            ),
            body: Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 35, bottom: 20),
                    child: Row(
                      children: [
                        //header
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'HELLO, ${widget.name.toUpperCase()} !',
                                style: TextStyle(
                                  fontFamily: 'System',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Let's train",
                                style: TextStyle(
                                  fontFamily: 'System',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  //populaire workouts
                  Column(
                    children: [
                      SectionHeader(
                        title: "Popular Workouts",
                        actionTitle: "See All",
                        action: () {
                        },
                      ),
                      segmentedControl,
                      SizedBox(height: 15),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: popularWorkoutData.getWorkoutlist().map((workout) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 5.0, right: 10.0, top:5.0, bottom:5.0 ),
                              child: PopulaireWorkoutCell(workout: workout),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  //Personal workouts
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SectionHeader(title: "Personal Workouts", actionTitle: "See All"),
                        SizedBox(
                          height: MediaQuery.of(context).size.height - 550,
                          child: ListView.builder(
                            itemCount: workoutData.getWorkoutlist().length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final workout = workoutData.getWorkoutlist()[index];
                              return Padding(
                                padding: const EdgeInsets.only(left: 8, right: 8),
                                child: PersonnalWorkoutCell(
                                  index: index,
                                  workout: workout,
                                  numberOfExercises: workoutData.numberOfExercicesInWorkout(workout.name),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50,)
                ],
              ),
            ),
          ),
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final userId = FirebaseAuth.instance.currentUser?.uid;
  String firstName = '';

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
      } else {
        print('User document not found!');
      }
    } catch (e) {
      print('Error fetching user profile: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Home(
      name: firstName,
    );
  }
}