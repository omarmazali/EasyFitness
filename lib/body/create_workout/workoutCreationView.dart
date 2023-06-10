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
      MaterialPageRoute(builder: (context) => Exercicecreation(workoutName: workoutName)),
    );
  }
  void clear(){
    _controller.clear();

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[900],
          body: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top:40.0, left: 15.0, right: 8.0),
                  child: NavigationHeader(title: "CREATE YOUR PERFECT WORKOUT", subtitle: "Give it a name first, then you'll add your exercices",),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35,top: 70),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: SizedBox(
                        height: 46,
                        width: 120,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              backgroundColor: Colors.lightGreenAccent,
                            ),
                            onPressed: () {
                              save();
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Next",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  size: 30.0,
                                  color: Colors.black,
                                ),
                              ],
                            )
                          //foregroundColor: Colors.black,
                          //backgroundColor: Colors.lightGreenAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
