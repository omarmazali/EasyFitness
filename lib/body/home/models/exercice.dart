// Fichier exercise.dart

import 'measurement_type.dart';

class Exercise {
  final String id;
  final String name;
  final ExerciseType type;
  int repetitions;
  int sets;
  double charge;
  Duration duration;
  bool isCompleted;

  Exercise({
    required this.id,
    required this.name,
    required this.type,
    this.repetitions = 0,
    this.sets = 0,
    this.charge = 0.0,
    this.duration = Duration.zero,
    this.isCompleted=false
  });
}
