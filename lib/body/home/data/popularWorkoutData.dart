import 'package:flutter/material.dart';

import '../models/popularExercice.dart';
import '../models/popularWorkout.dart';

class PopularWorkoutData extends ChangeNotifier {
  List<PopularWorkout> popularWoekoutList = [
    PopularWorkout(
        'Beginner - WORKOUT 1',
        level: "Beginner",
        imageUrl: "assets/images/workouts/beginner2.jpg",
        numberOfExercises: 2,
        description: "A beginner-level full-body workout focusing on bodyweight exercises and light cardio to build strength, improve coordination, and increase fitness level.",
        [
          PopularExercise(
              name: 'Exercise 1',
              details: 'Détails de l\'exercice 1', videoUrl: "assets/videos/shoulders/1.mp4",charge: 5,repetitions: 7,sets: 4),
          PopularExercise(
              name: 'Exercise 2', details: 'Détails de l\'exercice 2', videoUrl: "assets/videos/chest/1.mp4", charge: 5,repetitions: 10,sets: 4),
        ]),
    PopularWorkout(
        'Beginner - WORKOUT 2',
        level: "Beginner",
        imageUrl: "assets/images/workouts/beginner1.jpg",
        numberOfExercises: 2,
        description: "A beginner-level full-body workout incorporating resistance training exercises with dumbbells or resistance bands to strengthen the muscles and enhance core stability.",
        [
          PopularExercise(
              name: 'Exercise 1',
              details: 'Détails de l\'exercice 1',videoUrl: "assets/videos/shoulders/2.mp4",charge: 5,repetitions: 10,sets: 4),
          PopularExercise(
              name: 'Exercise 2', details: 'Détails de l\'exercice 2', videoUrl: "assets/videos/back/1.mp4", charge: 5,repetitions: 10,sets: 4),
        ]),
    PopularWorkout(
        'Intermediate - WORKOUT 1',
        level: "Intermediate",
        imageUrl: "assets/images/workouts/intermediate1.jpg",
        numberOfExercises: 3,
        description: "An intermediate-level full-body workout combining compound and isolation exercises to target multiple muscle groups and promote strength and muscle definition.",
        [
          PopularExercise(
              name: 'Exercise 1', details: 'Détails de l\'exercice 1', videoUrl: "assets/videos/shoulders/3.mp4", charge: 7.5,repetitions: 10,sets: 4),
          PopularExercise(
              name: 'Exercise 2', details: 'Détails de l\'exercice 2', videoUrl: "assets/videos/legs/1.mp4", charge: 20,repetitions: 10,sets: 4),
          PopularExercise(
              name: 'Exercise 3', details: 'Détails de l\'exercice 3', videoUrl: "assets/videos/arms/1.mp4", charge: 10,repetitions: 10,sets: 4),
        ]),
    PopularWorkout(
        'Intermediate - WORKOUT 2',
        level: "Intermediate",
        imageUrl: "assets/images/workouts/intermediate2.jpg",
        numberOfExercises: 3,
        description: "An intermediate-level full-body workout combining resistance training exercises with high-intensity interval training (HIIT) to improve strength, endurance, and cardiovascular fitness.",
        [
          PopularExercise(
              name: 'Exercise 1', details: 'Détails de l\'exercice 1', videoUrl: "assets/videos/arms/2.mp4", charge: 10,repetitions: 12,sets: 4),
          PopularExercise(
              name: 'Exercise 2', details: 'Détails de l\'exercice 2', videoUrl: "assets/videos/chest/2.mp4", charge: 20,repetitions: 12,sets: 4),
          PopularExercise(
              name: 'Exercise 3', details: 'Détails de l\'exercice 3', videoUrl: "assets/videos/shoulders/4.mp4", charge: 7.5,repetitions: 12,sets: 4),
        ]),
    PopularWorkout(
        'Intermediate - WORKOUT 3',
        level: "Intermediate",
        imageUrl: "assets/images/workouts/intermediate3.jpg",
        numberOfExercises: 3,
        description: "An intermediate-level full-body workout incorporating strength exercises, plyometrics, and functional movements to enhance power, agility, and overall athleticism.",
        [
          PopularExercise(
              name: 'Exercise 1', details: 'Détails de l\'exercice 1', videoUrl: "assets/videos/arms/4.mp4", charge: 10,repetitions: 12,sets: 4),
          PopularExercise(
              name: 'Exercise 2', details: 'Détails de l\'exercice 2', videoUrl: "assets/videos/arms/10.mp4", charge: 10,repetitions: 12,sets: 4),
          PopularExercise(
              name: 'Exercise 3', details: 'Détails de l\'exercice 3', videoUrl: "assets/videos/shoulders/9.mp4", charge: 7.5,repetitions: 12,sets: 4),
        ]),
    PopularWorkout(
        'Advanced - WORKOUT 1',
        level: "Advanced",
        imageUrl: "assets/images/workouts/advanced1.jpg",
        numberOfExercises: 4,
        description: "An advanced-level full-body workout involving heavy resistance training, advanced bodyweight exercises, and high-intensity intervals to challenge strength, endurance, and overall fitness level.",
        [
          PopularExercise(
              name: 'Exercise 1', details: 'Détails de l\'exercice 1', videoUrl: "assets/videos/legs/6.mp4", charge: 50,repetitions: 15,sets: 4),
          PopularExercise(
              name: 'Exercise 2', details: 'Détails de l\'exercice 2', videoUrl: "assets/videos/arms/9.mp4", charge: 20,repetitions: 15,sets: 4),
          PopularExercise(
              name: 'Exercise 3', details: 'Détails de l\'exercice 3', videoUrl: "assets/videos/chest/4.mp4", charge: 30,repetitions: 15,sets: 4),
          PopularExercise(
              name: 'Exercise 4', details: 'Détails de l\'exercice 4', videoUrl: "assets/videos/shoulders/8.mp4", charge: 10,repetitions: 15,sets: 4),
        ]),
  ];

  List<PopularWorkout> getWorkoutlist() {
    return popularWoekoutList;
  }

  PopularWorkout getReleventWorkout(String workoutName) {
    PopularWorkout revantWorkout =
        popularWoekoutList.firstWhere((workout) => workout.name == workoutName);
    return revantWorkout;
  }

  PopularExercise getReleventExercice(String exerciceName, String workoutName) {
    PopularWorkout revantWorkout = getReleventWorkout(workoutName);
    PopularExercise revantExercice = revantWorkout.exercises
        .firstWhere((exercice) => exercice.name == exerciceName);

    return revantExercice;
  }

  int numberOfExercicesInWorkout(String workoutName) {
    PopularWorkout revantWorkout =
        popularWoekoutList.firstWhere((workout) => workout.name == workoutName);

    return revantWorkout.exercises.length;
  }
}
