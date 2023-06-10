
import 'package:easyfitness/body/home/screens/popularExercisesPage.dart';
import 'package:flutter/material.dart';

import '../models/popularWorkout.dart';


class PopulaireWorkoutCell extends StatelessWidget {
  final PopularWorkout workout;

  PopulaireWorkoutCell({Key? key, required this.workout});
  void goToWorkotPage(BuildContext context, String workoutName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PopularExercisesPage(workoutName:  workoutName,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => goToWorkotPage(context, workout.name),
      child: Container(
        width: 196,
        height: 165,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: workout.imageUrl != null
                ? AssetImage(workout.imageUrl!)
                : AssetImage('assets/images/image.jpg'),
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
              SizedBox(height: 35,),
              SizedBox(height: 80,),
              Text(
                workout.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold ,color: Colors.white),
              ),
              Row(
                children: [
                  Icon(Icons.access_time,color: Colors.white,),
                  SizedBox(width: 4),
                  Text(
                    "${workout.time} min",
                    style: TextStyle(color: Colors.white,fontSize: 12),
                  ),
                  SizedBox(width: 12),
                  Icon(Icons.fitness_center,color: Colors.white,),
                  Text(
                    "${workout.numberOfExercises} exercice${workout.numberOfExercises?.compareTo(1) == 1 ? 's' : ''}",
                    style: TextStyle(color: Colors.white,fontSize: 12),
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
