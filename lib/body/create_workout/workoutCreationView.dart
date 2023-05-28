import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/data/data.dart';
import '../home/headers/navigationheader.dart';
import 'exerciceCreation.dart';

class WorkoutCreationView extends StatefulWidget {
  const WorkoutCreationView({Key? key}) : super(key: key);

  @override
  State<WorkoutCreationView> createState() => _WorkoutCreationViewState();
}

class _WorkoutCreationViewState extends State<WorkoutCreationView> {
  String workoutName = "";
  final TextEditingController _controller = TextEditingController();
  Color buttonColor = Colors.green; // Variable to control the button color

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void save(){
    Provider.of<WorkoutData>(context,listen:false).addWorkout(workoutName);
    clear();

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            Exercicecreation(workoutName: workoutName),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 0.1);
          var end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          return SlideTransition(position: animation.drive(tween), child: child);
        },
      ),
    );
  }
  void clear(){
    _controller.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor:Color(0xFFD0FD3E) , // Use the variable for button color
        onPressed: save,
        child: MouseRegion(

          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFD0FD3E),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavigationHeader(title: "Create your\n perfect workout ",backbutton: true),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Name your workout",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    controller: _controller,
                    onChanged: (text) {
                      setState(() {
                        workoutName = text;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
