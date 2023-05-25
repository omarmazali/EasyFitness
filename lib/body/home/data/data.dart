import 'package:flutter/cupertino.dart';
import '../models/exercice.dart';
import '../models/measurement_type.dart';
import '../models/workout.dart';
import 'hiveDb.dart';

class WorkoutData extends ChangeNotifier {
  final db = HiveDb();

  List<Workout> workoutList=[
    Workout(name: "Puch",numberOfExercises: 20,points: 2,time: 5,imageUrl:"assets/workout.jpg" , exercices: [Exercise(
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
  void initalizeWorkoutlist() {
    if (db.previousDataExists()) {
      workoutList = db.readFromDb();
    } else {
      db.saveToDb(workoutList);
    }

    // Add the following check to ensure the default workouts are added to workoutList if it's empty
    if (workoutList.isEmpty) {
      workoutList = [
        Workout(name: "Puch", numberOfExercises: 20,points: 2,time: 5,imageUrl:"assets/workout.jpg", exercices: [
          Exercise(
            id: "1",
            name: "sder",
            type: ExerciseType.rep,
            sets: 3,
            repetitions: 8,
            charge: 30.0,
          ),
        ]),
        Workout(name: "Pull", numberOfExercises: 7, points: 24, time: 5, imageUrl: "assets/workout.jpg", exercices: [
          Exercise(
            id: "1",
            name: "sder",
            type: ExerciseType.rep,
            sets: 3,
            repetitions: 8,
            charge: 30.0,
          ),
          Exercise(
            id: "2",
            name: "dhh",
            type: ExerciseType.rep,
            sets: 3,
            repetitions: 8,
            charge: 30.0,
          ),
        ]),
      ];

      // Save the default workouts to the database
      db.saveToDb(workoutList);
    }
  }





  List<Workout> getWorkoutlist(){
    return workoutList;

  }
  void loadWorkoutsFromDb() {
    workoutList = db.readFromDb(); // Load workouts from the database
    notifyListeners();
  }


  void addWorkout(String name) {
    workoutList.add(Workout(name: name, exercices: []));
    db.saveToDb(workoutList); // Save the workouts to the database
    notifyListeners();
  }

  void addExercise(
      String workoutName,
      String exerciseName,
      ExerciseType type,
      int repetitions,
      int sets,
      double charge,
      Duration duration,
      ) {
    Workout relevantWorkout =
    workoutList.firstWhere((workout) => workout.name == workoutName);

    if (type == ExerciseType.rep) {
      relevantWorkout.exercices.add(Exercise(
        id: '1',
        name: exerciseName,
        type: type,
        repetitions: repetitions,
        sets: sets,
        charge: charge,
      ));
    } else if (type == ExerciseType.time) {
      relevantWorkout.exercices.add(Exercise(
        id: '1',
        name: exerciseName,
        type: type,
        duration: duration,
      ));
    } else {
      print('Invalid workout type.');
      return;
    }

    db.saveToDb(workoutList); // Save the updated workout list to the database
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