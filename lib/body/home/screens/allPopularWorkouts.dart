import 'package:easyfitness/body/home/screens/populaireWorkoutCell.dart';
import 'package:easyfitness/body/home/screens/popularExercisesPage.dart';
import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:provider/provider.dart';

import '../../acceuil.dart';
import '../data/popularWorkoutData.dart';
import '../models/popularWorkout.dart';
import 'Home.dart';


class AllPopularWorkoutsPage extends StatefulWidget {
  final String name;

  AllPopularWorkoutsPage({required this.name,});

  @override
  _AllPopularWorkoutsPageState createState() => _AllPopularWorkoutsPageState();
}

class _AllPopularWorkoutsPageState extends State<AllPopularWorkoutsPage> {
  int selectedLevelIndex = 0; // Track the selected level index

  void goToWorkoutPage(BuildContext context, String workoutName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PopularExercisesPage(workoutName: workoutName),
      ),
    );
  }

  List<PopularWorkout> filterWorkoutsByLevel(List<PopularWorkout> workouts) {
    final selectedLevel = ['Beginner', 'Intermediate', 'Advanced'][selectedLevelIndex];
    return workouts.where((workout) => workout.level == selectedLevel).toList();
  }

  @override
  Widget build(BuildContext context) {
    final popularWorkoutData = Provider.of<PopularWorkoutData>(context);
    final List<PopularWorkout> filteredWorkouts = filterWorkoutsByLevel(popularWorkoutData.getWorkoutlist());

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            children: [
              SizedBox(
                height: 40,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Acceuil(),
                    ));
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 25,
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.grey[800],
                ),
              ),
              SizedBox(width: 50,),
              Text(
                "ALL POPULAR \nWORKOUTS",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.0,
                  fontFamily: 'IntegralCF',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 22, bottom: 20, left: 4),
            child: MaterialSegmentedControl(
              children: {
                0: Text(
                  'Beginner',
                  style: TextStyle(fontSize: 14),
                ),
                1: Text(
                  'Intermediate',
                  style: TextStyle(fontSize: 14),
                ),
                2: Text(
                  'Advanced',
                  style: TextStyle(fontSize: 14),
                ),
              },
              selectionIndex: selectedLevelIndex,
              borderColor: Colors.grey[900],
              selectedColor: Colors.lightGreenAccent,
              unselectedColor: Color(0xFF2C2C2E),
              selectedTextStyle: TextStyle(color: Colors.black, fontSize: 12),
              unselectedTextStyle: TextStyle(color: Colors.white, fontSize: 12),
              borderRadius: 14,
              onSegmentChosen: (index) {
                setState(() {
                  selectedLevelIndex = index;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredWorkouts.length,
              itemBuilder: (context, index) {
                final workout = filteredWorkouts[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        workout.name + ":",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 12),
                      GestureDetector(
                        onTap: () => goToWorkoutPage(context, workout.name),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.white,
                          ),
                          child: PopulaireWorkoutCell(
                            width: double.infinity,
                            height: 170,
                            workout: workout,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}