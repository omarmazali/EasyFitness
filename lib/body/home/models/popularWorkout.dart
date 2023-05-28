import 'package:easyfitness/body/home/models/popularExercice.dart';

class PopularWorkout {
  final String name;
  final String? imageUrl;
  final List<PopularExercise> exercises;
  final int? points;
  final int? time;
  final int? numberOfExercises;

  PopularWorkout(
      this.name,
      this.exercises, {
        this.imageUrl,
         this.points,
         this.time,
         this.numberOfExercises,
      });
}
