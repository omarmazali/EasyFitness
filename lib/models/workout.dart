import 'exercice.dart';

class Workout {
  final String? imageUrl;
  final String name;
  final int? time;
  final int? numberOfExercises;
  final int? points;
  final List<Exercise> exercices;

  Workout({
    required this.name,
    required this.exercices,
    this.imageUrl,
    this.time,
    this.numberOfExercises,
    this.points,
  });
}
