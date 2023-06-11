import 'package:easyfitness/body/home/models/popularExercice.dart';

class PopularWorkout {
  final String name;
  final String? imageUrl;
  final List<PopularExercise> exercises;
  final int? points;
  final int? time;
  final int? numberOfExercises;
  final String? level;
  final String? description;

  PopularWorkout(
    this.name,
    this.exercises, {
    this.imageUrl,
    this.points,
    this.time,
    this.numberOfExercises,
    this.level,
    this.description,
  });
}
