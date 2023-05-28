class PopularExercise {
  final String name;
  final String? imageUrl;
  final int repetitions;
  final int sets;
  final double charge;
  final String details;


  PopularExercise({
    required this.name,
    this.imageUrl,
    this.repetitions = 0,
    this.sets = 0,
    this.charge = 0.0,
    required this.details
  });
}
