import 'package:easyfitness/dat_time/dat_time.dart';
import 'package:easyfitness/models/exercice.dart';
import 'package:hive/hive.dart';

import '../models/measurement_type.dart';
import '../models/workout.dart';

class HiveDb {
  final _myBox = Hive.box("workout_dataBase");

  List<String> objtoWorkoutlist(List<Workout> workouts) {
    List<String> workoutList = [];
    for (int i = 0; i < workouts.length; i++) {
      workoutList.add(
        workouts[i].name,
      );
    }
    return workoutList;
  }

  List<List<List<String>>> objtoExercicelist(List<Workout> workouts) {
    List<List<List<String>>> exercicelist = [];

    for (int i = 0; i < workouts.length; i++) {
      List<Exercise> exerciceInWorkout = workouts[i].exercices;
      List<List<String>> individualWorkout = [];

      for (int j = 0; j < exerciceInWorkout.length; j++) {
        List<String> individualExercise = [
          exerciceInWorkout[j].name,
          exerciceInWorkout[j].sets.toString(),
          exerciceInWorkout[j].charge.toString(),
          exerciceInWorkout[j].repetitions.toString(),
          exerciceInWorkout[j].type.toString(),
          exerciceInWorkout[j].isCompleted.toString(),
        ];
        individualWorkout.add(individualExercise);
      }

      exercicelist.add(individualWorkout);
    }

    return exercicelist;
  }

  bool exerciceCompleted(List<Workout> workouts) {
    for (var workout in workouts) {
      for (var exercice in workout.exercices) {
        if (exercice.isCompleted) {
          return true;
        }
      }
    }
    return false;
  }

  bool previousDataExists() {
    if (_myBox.isEmpty) {
      _myBox.put("start day", todayDateyyyymmdd());
      return false;
    } else {
      return true;
    }
  }

  String getStartDay() {
    return _myBox.get("start day");
  }

  void saveToDb(List<Workout> workouts) {
    final workoutList = objtoWorkoutlist(workouts);
    final exercicelist = objtoExercicelist(workouts);
    if (exerciceCompleted(workouts)) {
      _myBox.put("completion Statust" + todayDateyyyymmdd(), 1);
    } else {
      _myBox.put("completion Statust" + todayDateyyyymmdd(), 0);
    }
    _myBox.put("workouts", workoutList);
    _myBox.put("exercicelist", exercicelist);
  }

  List<Workout> readFromDb() {
    List<Workout> mySavedWorkouts = [];
    List<String> workoutNames = _myBox.get("workouts");
    List<dynamic> exercicedetails = _myBox.get("exercicelist");

    if (workoutNames != null && exercicedetails != null) {
      for (int i = 0; i < workoutNames.length; i++) {
        List<Exercise> exercicesInEachWorkout = [];
        for (int j = 0; j < exercicedetails[i].length; j++) {
          exercicesInEachWorkout.add(
            Exercise(
              id: j.toString(),
              name: exercicedetails[i][j][0],
              sets: int.parse(exercicedetails[i][j][1]),
              charge: double.parse(exercicedetails[i][j][2]),
              repetitions: int.parse(exercicedetails[i][j][3]),
              type: _convertToExerciseType(exercicedetails[i][j][4]),
              isCompleted: exercicedetails[i][j][5] == "true" ? true : false,
            ),
          );
        }

        Workout workout =
        Workout(name: workoutNames[i], exercices: exercicesInEachWorkout);
        mySavedWorkouts.add(workout);
      }
    }

    return mySavedWorkouts;
  }

  ExerciseType _convertToExerciseType(String typeString) {
    switch (typeString) {
      case 'rep':
        return ExerciseType.rep;
      case 'time':
        return ExerciseType.time;
    // Add more cases for other exercise types
      default:
        return ExerciseType.rep;
    }
  }
}
