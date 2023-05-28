import 'package:flutter/material.dart';

import '../models/popularExercice.dart';
import '../models/popularWorkout.dart';


class PopularWorkoutData extends ChangeNotifier{
 List<PopularWorkout> popularWoekoutList= [
  PopularWorkout('Workout 1',[
  PopularExercise(name: 'Exercice 1',  details: 'Détails de l\'exercice 1',imageUrl: "assets/signup.png"),
   PopularExercise(name: 'Exercice 2',  details: 'Détails de l\'exercice 2'),
   PopularExercise(name: 'Exercice 3',  details: 'Détails de l\'exercice 3'),


  ]),
  PopularWorkout('Workout 2', [
   PopularExercise(name: 'Exercice 1',  details: 'Détails de l\'exercice 1'),
   PopularExercise(name: 'Exercice 2',  details: 'Détails de l\'exercice 2'),
   PopularExercise(name: 'Exercice 3',  details: 'Détails de l\'exercice 3'),
  ]),
  ];
 List<PopularWorkout> getWorkoutlist(){
  return popularWoekoutList;

 }
 PopularWorkout getReleventWorkout(String workoutName){
  PopularWorkout revantWorkout =popularWoekoutList.firstWhere((workout) => workout.name==workoutName);
  return revantWorkout;
 }
 PopularExercise getReleventExercice(String exerciceName,String workoutName){
  PopularWorkout revantWorkout =getReleventWorkout(workoutName);
  PopularExercise revantExercice =revantWorkout.exercises.firstWhere((exercice) => exercice.name==exerciceName);

  return revantExercice;
 }
 int numberOfExercicesInWorkout(String workoutName){
  PopularWorkout revantWorkout =popularWoekoutList.firstWhere((workout) => workout.name==workoutName);

  return revantWorkout.exercises.length;
 }
}