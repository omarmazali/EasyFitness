import 'package:easyfitness/body/home/headers/navigationheader.dart';
import 'package:easyfitness/body/home/headers/sectionHeader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/popularWorkoutData.dart';
import 'DetailPage.dart';
import 'PopularExercicesCell.dart';


class PopularExercisesPage extends StatefulWidget {
  final String workoutName;

  PopularExercisesPage({required this.workoutName});

  @override
  _PopularExercisesPageState createState() => _PopularExercisesPageState();
}

class _PopularExercisesPageState extends State<PopularExercisesPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<PopularWorkoutData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[900],
        body: Container(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                child: Image.asset(
                  value.getReleventWorkout(widget.workoutName).imageUrl ?? '',
                  fit: BoxFit.cover,
                  height: size.height * 0.4,
                  width: size.width,
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.workoutName,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 14.0,right: 10),
                child: Text(
                  value.getReleventWorkout(widget.workoutName).description ?? ''  ,
                  style: TextStyle(

                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: value.numberOfExercicesInWorkout(widget.workoutName),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      // Handle onTap event here
                      // You can navigate to a new page or perform any action you want
                      // For example, you can navigate to a detail page:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExerciseDetailPage(
                            exercises: value.getReleventWorkout(widget.workoutName).exercises,
                            currentIndex: currentIndex,
                          ),
                        ),
                      );
                    },
                    child: PopularExercicesCell(
                      repetitions: value.getReleventWorkout(widget.workoutName).exercises[index].repetitions,
                      imgurl: value.getReleventWorkout(widget.workoutName).exercises[index].imageUrl ?? 'assets/images/defaultexercice.jpg',
                      charge: value.getReleventWorkout(widget.workoutName).exercises[index].charge,
                      name: value.getReleventWorkout(widget.workoutName).exercises[index].name,
                      sets: value.getReleventWorkout(widget.workoutName).exercises[index].sets,
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExerciseDetailPage(
                          exercises: value.getReleventWorkout(widget.workoutName).exercises,
                          currentIndex: 0,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                    backgroundColor: Colors.lightGreenAccent,
                    textStyle: TextStyle(color: Colors.black),
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
