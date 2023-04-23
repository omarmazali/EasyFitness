import 'package:easyfitness/scroller.dart';
import 'package:flutter/material.dart';

class Level extends StatefulWidget {
  const Level({Key? key}) : super(key: key);

  @override
  State<Level> createState() => _LevelState();
}

class _LevelState extends State<Level> {

  List<String> items =[
    "Rookie",
    "Beginner",
    "Intermediate",
    "Advance",
    "True beast"
  ];

  @override
  Widget build(BuildContext context) {
    return Scroller(items: items, Gtext: "YOUR REGULAR PHYSICAL ACTIVITY LEVEL", Ptext: "THIS HELPS US CREATE YOUR PERSONALIZED PLAN", Ppath :"Goal", Npath :"Level", Height: 70);
  }
}
