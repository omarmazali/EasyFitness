import 'package:easyfitness/body/acceuil.dart';
import 'package:easyfitness/body/home/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../create_workout/WorkotPage.dart';
import '../../create_workout/workoutCreationView.dart';
import '../data/data.dart';
import '../models/workout.dart';

class AllPersonalWorkoutsPage extends StatefulWidget {
  final String name;

  AllPersonalWorkoutsPage({required this.name});

  @override
  State<AllPersonalWorkoutsPage> createState() => _AllPersonalWorkoutsPageState();
}

class _AllPersonalWorkoutsPageState extends State<AllPersonalWorkoutsPage> {
  void goToWorkoutPage(BuildContext context, String workoutName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkotPage(Workoutname: workoutName),
      ),
    );
  }

  void deleteWorkout(BuildContext context, Workout workout) {
    final workoutData = Provider.of<WorkoutData>(context, listen: false);
    workoutData.deleteWorkout(workout);
  }

  void createNewPersonalWorkout(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkoutCreationView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final workoutData = Provider.of<WorkoutData>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreenAccent,
        onPressed: () => createNewPersonalWorkout(context),
        child: Icon(Icons.add, color: Colors.white),
      ),
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            children: [
              SizedBox(
                height: 40,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Acceuil(),
                    ));
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 25,
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.grey[800],
                ),
              ),
              SizedBox(width: 50,),
              Text(
                "ALL PERSONAL \nWORKOUTS",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.0,
                  fontFamily: 'IntegralCF',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          if (workoutData.getWorkoutlist().isEmpty)
            Center(
              child: Text(
                'No workouts created',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: workoutData.getWorkoutlist().length,
                itemBuilder: (context, index) {
                  final workout = workoutData.getWorkoutlist()[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: GestureDetector(
                      onTap: () => goToWorkoutPage(context, workout.name),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        color: Colors.white,
                        child: ListTile(
                          leading: Icon(Icons.fitness_center),
                          title: Text(workout.name),
                          subtitle: Text(
                            '${workoutData.numberOfExercicesInWorkout(workout.name)} Exercises',
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () => deleteWorkout(context, workout),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
