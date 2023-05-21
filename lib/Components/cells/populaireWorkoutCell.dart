import 'package:easyfitness/Components/pointBadge.dart';
import 'package:easyfitness/models/workout.dart';
import 'package:flutter/material.dart';

class PopulaireWorkout extends StatelessWidget {
  final Workout workout;

  PopulaireWorkout({Key? key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 196,
      height: 165,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(workout.imageUrl ?? ""),
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
            Row(
              children: [
                SizedBox(width: 110,),
                PointBadge(point: workout.points ),
              ],
            ),
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
    );

  }
}

