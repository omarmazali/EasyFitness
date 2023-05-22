
import 'package:easyfitness/body/create_workout/workoutCreationView.dart';
import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:provider/provider.dart';

import '../models/levels.dart';
import 'WorkoutPersonaleS.dart';
import 'populaireWorkoutCell.dart';
import '../headers/sectionHeader.dart';
import '../data/data.dart';




class Home extends StatefulWidget {
  final String name;
  final String? profileUrl;
  final int userlevel;

  Home({Key? key, required this.name, this.profileUrl, required this.userlevel});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void CreatNewPersonelWorkout(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => WorkoutCreationView(),
      ),
    );
  }

  ProficiencyLevel _level=ProficiencyLevel.beginner;

  Widget _buildSegmentedControl() {
    return Container(
      width: double.infinity,

      child: MaterialSegmentedControl(
        children: {
          ProficiencyLevel.beginner.index:Text('Beginner'),
          ProficiencyLevel.intermediate.index:Text('intermediate',),
           ProficiencyLevel.advanced.index:Text('advanced')

        },
        selectionIndex: _level.index,
        borderColor: Colors.grey[900],
        selectedColor:   Color(0xFFD0FD3E),
        unselectedColor:  Color(0xFF2C2C2E),
        selectedTextStyle: TextStyle(color: Colors.black, fontSize: 10),
        unselectedTextStyle: TextStyle(color: Colors.white, fontSize: 10),
        borderWidth: 0.1,
        borderRadius: 20,


        onSegmentTapped: (index) {
          setState(() {
            _level = ProficiencyLevel.values[index];
          });
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    Widget segmentedControl = _buildSegmentedControl();

    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Color(0xff1C1C1E) ,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFD0FD3E),
          onPressed: () => CreatNewPersonelWorkout(context),
          child: Icon(Icons.add, color: Colors.white),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 20),
              child: Row(
                children: [
                  //header
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HELLO, ${widget.name.toUpperCase()} !',
                        style: TextStyle(
                          fontFamily: 'System',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Let's train",
                        style: TextStyle(
                          fontFamily: 'System',
                          fontWeight: FontWeight.bold,
                          fontSize: 26.0,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        'Level ${widget.userlevel}',
                        style: TextStyle(
                          fontFamily: 'System',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                          color: Colors.grey[500],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ClipOval(
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Stack(
                            children: [
                              Center(child: CircularProgressIndicator()),
                              widget.profileUrl == null
                                  ? Container(
                                color: Colors.grey,
                                width: 75,
                                height: 75,
                              )
                                  : Image.network(
                                widget.profileUrl!,
                                fit: BoxFit.cover,
                                width: 75,
                                height: 75,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //populaire workouts

              Column(
                children: [
                  SectionHeader(
                    title: "Populaire Workouts",
                    actionTitle: "see all",
                    action: () {
                      print("owww im working bro");
                    },
                  ),
                  segmentedControl,
                  SizedBox(height: 15,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: value.getWorkoutlist().map((workout) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: PopulaireWorkout(workout: workout),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),

            //my workouts
            SingleChildScrollView(child:
               Column(
                children: [
                  SectionHeader(title: "My Workouts  ", actionTitle: " See all"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 550,
                    child: ListView.builder(
                      itemCount: value.getWorkoutlist().length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final workout = value.getWorkoutlist()[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: PersonnalWorkoutCell(workout: workout,numberOfExercises: value.numberOfExercicesInWorkout(workout.name), ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePreviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home(
      name: "oussama",
      userlevel: 20,
      profileUrl: null,
    );
  }
}
