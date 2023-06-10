import 'package:duration_picker/duration_picker.dart';
import 'package:easyfitness/body/acceuil.dart';

import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:provider/provider.dart';

import '../home/data/data.dart';
import '../home/headers/navigationheader.dart';
import '../home/models/measurement_type.dart';
import '../home/screens/Home.dart';



class Exercicecreation extends StatefulWidget {
  final String workoutName;


  const Exercicecreation({Key? key, required this.workoutName}) : super(key: key);

  @override
  State<Exercicecreation> createState() => _ExercicecreationState();
}

class _ExercicecreationState extends State<Exercicecreation> {
  String exerciceName = "";

  int? charge;
  ExerciseType _workoutType = ExerciseType.rep;
  void save(){
    double?  charge= double.tryParse(_controllercharge.text) ;
    int?  sets= int.tryParse(_controllersets.text) ;
    int?  repetitions= int.tryParse(_controllerreps.text) ;
    double validCharge = charge ?? 0.0;
    int validsets = sets ?? 0;
    int validrepetitions = repetitions ?? 0;

    String exerciseName=_controller.text;
    if (_workoutType.name=="rep") {
      Provider.of<WorkoutData>(context, listen: false).addExercise(
          widget.workoutName, exerciseName, _workoutType, validrepetitions, validsets, validCharge,_duration);
    }
    else if (_workoutType.name=="Time"){
    }
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Acceuil(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 0.1);
          var end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          return SlideTransition(position: animation.drive(tween), child: child);
        },
      ),
    );
  }




  Duration _duration =Duration(hours: 0,minutes: 0);


  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllersets = TextEditingController();
  final TextEditingController _controllerreps = TextEditingController();
  final TextEditingController _controllercharge = TextEditingController();
  final TextEditingController _controllerpause = TextEditingController();





  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  Widget _buildTextField() {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 15, right: 20),
      width: 400,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Name your Exercice",
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
            exerciceName = text;
          });
        },
      ),
    );
  }
  Widget _buildSegmentedControl() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),

      child: MaterialSegmentedControl(
        children: {
          ExerciseType.rep.index: Text("Rep", style: TextStyle(fontSize: 12),),
          ExerciseType.time.index: Text("Time", style: TextStyle(fontSize: 12)),
        },
        selectionIndex: _workoutType.index,
        borderColor: Colors.grey[900],
        selectedColor:   Colors.lightGreenAccent,
        unselectedColor:  Colors.grey[800],
        selectedTextStyle: TextStyle(color: Colors.black, fontSize: 10),
        unselectedTextStyle: TextStyle(color: Colors.white, fontSize: 10),
        borderWidth: 0.1,
        borderRadius: 10,


        onSegmentTapped: (index) {
          setState(() {
            _workoutType = ExerciseType.values[index];
          });
        },
      ),
    );
  }





  Widget _buildTimeWidget() {
    return Column(
      children: [
        DurationPicker(

          baseUnit: BaseUnit.minute,
          duration: _duration,
          onChange: (val) {
            setState(() {
              _duration = val;
            });
          },
        ),
        SizedBox(height: 10),
        Text(
          '${_duration.inHours} hours : ${_duration.inMinutes % 60}  min',

          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ],
    );
  }


  Widget _buildRepWidget() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

            Container(
                  width: 300,
                  child: TextField(

                    controller: _controllersets,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      suffixIcon:        Icon(Icons.format_list_numbered, size: 16 ,color: Colors.lightGreenAccent,),

                      labelText: 'Sets',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Color(0xFF2C2C2E),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Color(0xFFD0FD3E),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    ),
                  ),
                ),


          SizedBox(height: 8),
          Container(
            width: 300,
                  child: TextField(
                    controller: _controllerreps,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.repeat, size: 18,color:Colors.lightGreenAccent ,),

                      labelText: 'Reps',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Color(0xFF2C2C2E),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Color(0xFFD0FD3E),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    ),
                  ),
                ),


          SizedBox(height: 8),
          Container(
            width: 300,
                  child: TextField(
                    controller: _controllercharge,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      suffixIcon:   Icon(Icons.fitness_center, size: 16,color: Colors.lightGreenAccent,),
                      labelText: 'Charge',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Color(0xFF2C2C2E),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Color(0xFFD0FD3E),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    ),
                  ),
                ),

        ],
      ),
    );
  }

  Widget _buildContent() {
    switch (_workoutType.name){
      case "rep":
        return _buildRepWidget();
        break;
      case "time":
        return _buildTimeWidget();
        break;
      default:
        return _buildTimeWidget();
    }

  }


  Widget build(BuildContext context) {
    Widget textField = _buildTextField();
    Widget segmentedControl = _buildSegmentedControl();
    Widget Content = _buildContent();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:40.0, left: 15.0, right: 8.0),
            child: NavigationHeader(
              title: widget.workoutName.toUpperCase(),
              subtitle: "Choose the type of your exercise and add it",
              backbutton: true,
            ),
          ),
          Center(
            child: Column(
              children: [
                textField,
                segmentedControl,
              ],
            ),
          ),
          SizedBox(height: 50,),
          Content,
          SizedBox(height: 50,),
          SizedBox(
            height: 46,
            width: 140,
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
                      "Create",
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
          )
        ],
      ),
    );
  }


}


