import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../create_workout/WorkotPage.dart';
import '../data/data.dart';
import '../models/workout.dart';


class PersonnalWorkoutCell extends StatelessWidget {
  final Workout workout;
  final int numberOfExercises;
  final int index;

  PersonnalWorkoutCell({Key? key, required this.workout, required this.numberOfExercises, required this.index});

  void goToWorkoutPage(BuildContext context, String workoutName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkotPage(Workoutname: workoutName),
      ),
    );
  }

  void deleteWorkout(BuildContext context) {
    final workoutData = Provider.of<WorkoutData>(context, listen: false);
    workoutData.deleteWorkout(workout);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => goToWorkoutPage(context, workout.name),

      child: Container(
        width: 300,
        height: 170,
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black.withOpacity(0.2),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6,),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    workout.name.toUpperCase(),
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, left: 10),
                  child: Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.white),
                      SizedBox(width: 4),
                      Text(
                        "${workout.time} min",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(width: 12),
                      Icon(Icons.fitness_center, color: Colors.white),
                      Text(
                        "${numberOfExercises} exercise${numberOfExercises?.compareTo(1) == 1 ? 's' : ''}",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.delete_forever_outlined, color: Colors.red),
                onPressed: () => deleteWorkout(context),
              ),
            ),
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                child: Text(
                  '#W${index + 1}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}