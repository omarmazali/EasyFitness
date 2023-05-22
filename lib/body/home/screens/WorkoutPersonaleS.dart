import 'package:flutter/material.dart';

import '../../../body/home/models/workout.dart';
import '../../../body/create_workout/WorkotPage.dart';

class PersonnalWorkoutCell extends StatelessWidget {
  final Workout workout;
  final int numberOfExercises;

  PersonnalWorkoutCell({Key? key, required this.workout ,required this.numberOfExercises});

  void goToWorkotPage(BuildContext context, String workoutName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkotPage(Workoutname: workoutName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 170,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(workout.imageUrl ?? ""),
          fit: BoxFit.fill,
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
            Spacer(),
            Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () => goToWorkotPage(context, workout.name), // Pass the context here
                  child: Icon(Icons.arrow_forward_ios,color: Color(0xFFD0FD3E),), // Add the arrow icon widget here
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                workout.name,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold ,color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10,left: 10),
              child: Row(

                children: [
                  Icon(Icons.access_time,color: Colors.white,),
                  SizedBox(width: 4),
                  Text(
                    "${workout.time} min",
                    style: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                  SizedBox(width: 12),
                  Icon(Icons.fitness_center,color: Colors.white,),
                  Text(
                    "${numberOfExercises} exercice${numberOfExercises?.compareTo(1) == 1 ? 's' : ''}",
                    style: TextStyle(color: Colors.white,fontSize: 18),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
