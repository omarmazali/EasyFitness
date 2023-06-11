import 'package:easyfitness/body/home/screens/popularExercisesPage.dart';
import 'package:flutter/material.dart';

import '../models/popularWorkout.dart';


class PopulaireWorkoutCell extends StatelessWidget {
  final PopularWorkout workout;
  final double width ;
  final double height ;

  PopulaireWorkoutCell({Key? key, required this.workout,required this.width,required this.height});
  void goToWorkotPage(BuildContext context, String workoutName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PopularExercisesPage(workoutName:  workoutName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => goToWorkotPage(context, workout.name, ),
      child: Container(
        width: width ,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: workout.imageUrl != null
                ? AssetImage(workout.imageUrl!)
                : AssetImage('assets/images/workouts/beginner1.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80,),
                  Text(
                    workout.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold ,color: Colors.white),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Icon(Icons.fitness_center,color: Colors.white,),
                      Text(
                        "  ${workout.numberOfExercises} exercice${workout.numberOfExercises?.compareTo(1) == 1 ? 's' : ''}",
                        style: TextStyle(color: Colors.white,fontSize: 12),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}