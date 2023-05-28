import 'package:flutter/material.dart';

import '../models/popularExercice.dart';


class ExerciseDetailPage extends StatelessWidget {
  final List<PopularExercise> exercises;
  final int currentIndex;

  ExerciseDetailPage({required this.exercises, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final exercise = exercises[currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text(exercise.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(exercise.details),
            ElevatedButton(
              child: Text('Next'),
              onPressed: () {
                if (currentIndex < exercises.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExerciseDetailPage(exercises: exercises, currentIndex: currentIndex + 1),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Congratulations!'),
                        content: Text('You have completed your workout.'),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed('Acceuil');
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
