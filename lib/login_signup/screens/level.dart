import 'package:easyfitness/login_signup/model/scrollerModel.dart';
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
    return Scroller(name: 'level', items: items, Gtext: "YOUR REGULAR PHYSICAL ACTIVITY LEVEL", Ptext: "THIS HELPS US CREATE YOUR PERSONALIZED PLAN", Ppath :"Goal", Npath :"Home", Height: 100, Size: 30, SizeBox: 70);
  }
}
