
import 'package:easyfitness/body/home/models/exercice.dart';
import 'package:easyfitness/body/home/models/measurement_type.dart';
import 'package:easyfitness/body/home/models/workout.dart';
import 'package:flutter/cupertino.dart';

class WorkoutData extends ChangeNotifier {
  List<Workout> workoutList=[
    Workout(name: "Push",numberOfExercises: 20,points: 2,time: 5,imageUrl:"assets/workout.jpg" , exercices: [Exercise(
      id: "1",
      name: "sder",
      type: ExerciseType.rep,
      sets: 3,
      repetitions: 8,
      charge: 30.0,
    )]),
    Workout(name: "Pull",numberOfExercises: 7,points: 24,time: 5,imageUrl:"assets/workout.jpg" , exercices: [Exercise(
      id: "1",
      name: "sder",
      type: ExerciseType.rep,
      sets: 3,
      repetitions: 8,
      charge: 30.0,
    ),Exercise(
      id: "2",
      name: "dhh",
      type: ExerciseType.rep,
      sets: 3,
      repetitions: 8,
      charge: 30.0,
    ),
    ]),
  ];

  List<Workout> getWorkoutlist(){
    return workoutList;
  }

  void  addWorkout(String name){
    workoutList.add(Workout(name: name, exercices: []));
    notifyListeners();


  }
  void addExercise(String workoutName, String exerciseName, ExerciseType type, int repetitions, int sets, double charge, Duration duration,) {
    Workout revantWorkout =workoutList.firstWhere((workout) => workout.name==workoutName);


    if (type == ExerciseType.rep) {
      revantWorkout.exercices.add(Exercise(
        id: '1',
        name: exerciseName,
        type: type,
        repetitions: repetitions,
        sets: sets,
        charge: charge,
      ));
    } else if (type == ExerciseType.time) {
      revantWorkout.exercices.add(Exercise(
        id: '1',
        name: exerciseName,
        type: type,
        duration: duration,
      ));
    } else {
      print('Invalid workout type.');
      return;
    }
    notifyListeners();
  }
  int numberOfExercicesInWorkout(String workoutName){
    Workout revantWorkout =workoutList.firstWhere((workout) => workout.name==workoutName);

    return revantWorkout.exercices.length;
  }
  Workout getReleventWorkout(String workoutName){
    Workout revantWorkout =workoutList.firstWhere((workout) => workout.name==workoutName);
    return revantWorkout;
  }
  Exercise getReleventExercice(String exerciceName,String workoutName){
    Workout revantWorkout =getReleventWorkout(workoutName);
    Exercise revantExercice =revantWorkout.exercices.firstWhere((exercice) => exercice.name==exerciceName);

    return revantExercice;
  }
  void checkOffExercises(String workoutName,String exerciceName ){
    Exercise revantExercice=getReleventExercice(exerciceName, workoutName);
    revantExercice.isCompleted  =! revantExercice.isCompleted;
    notifyListeners();


  }
  void updateExercise(String workoutName, String exerciseName, {Duration? duration, int? sets, int? repetitions, double? charge}) {
    Workout relevantWorkout = workoutList.firstWhere((workout) => workout.name == workoutName);
    Exercise relevantExercise = relevantWorkout.exercices.firstWhere((exercise) => exercise.name == exerciseName);

    if (relevantExercise.type == ExerciseType.time && duration != null) {
      relevantExercise.duration = duration;
    } else if (relevantExercise.type == ExerciseType.rep) {
      if (sets != null) {
        relevantExercise.sets = sets;
      }
      if (repetitions != null) {
        relevantExercise.repetitions = repetitions;
      }
      if (charge != null) {
        relevantExercise.charge = charge;
      }
    } else {
      print('Invalid update parameters for exercise type.');
      return;
    }

    notifyListeners();
  }





}

