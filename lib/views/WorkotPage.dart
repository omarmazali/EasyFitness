
import 'package:easyfitness/views/exerciceCreation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/cells/exercicescell.dart';
import '../data/data.dart';

class WorkotPage extends StatefulWidget {
  final String Workoutname;

  const WorkotPage({
    Key? key,
    required this.Workoutname,
  }) : super(key: key);

  @override
  State<WorkotPage> createState() => _WorkotPageState();
}
void CreatNewPersonelWorkout(BuildContext context, String workoutName) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Exercicecreation(workoutName: workoutName),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.1);
        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    ),
  );
}




class _WorkotPageState extends State<WorkotPage> {

  void onCheckboxChanged(String workoutname, String exercicename) {
    Provider.of<WorkoutData>(context, listen: false)
        .checkOffExercises(workoutname, exercicename);
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
          builder: (context,value,child)=> Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.lightGreenAccent,
                onPressed: () => CreatNewPersonelWorkout(context, widget.Workoutname),
                child: Icon(Icons.add,color: Colors.white,),
              ),
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          widget.Workoutname,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Change the color of the back button here
        ),
      ),
            body: ListView.builder(
              itemCount: value.numberOfExercicesInWorkout(widget.Workoutname),
                itemBuilder:(context, index) =>  ExercicesCell(repetitions: value.getReleventWorkout(widget.Workoutname).exercices[index].repetitions,
                  charge: value.getReleventWorkout(widget.Workoutname).exercices[index].charge,
                  name: value.getReleventWorkout(widget.Workoutname).exercices[index].name,
                  sets: value.getReleventWorkout(widget.Workoutname).exercices[index].sets,
                  duration: value.getReleventWorkout(widget.Workoutname).exercices[index].duration,
                  isCompleted: value.getReleventWorkout(widget.Workoutname).exercices[index].isCompleted ,
                  onCheckboxChanged: (val) {onCheckboxChanged(widget.Workoutname,value.getReleventWorkout(widget.Workoutname).exercices[index].name,);},
                )
            )
            ),
    );



  }}

