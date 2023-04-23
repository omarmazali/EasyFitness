import 'package:easyfitness/scroller.dart';
import 'package:flutter/material.dart';

class Goal extends StatefulWidget {
  const Goal({Key? key}) : super(key: key);

  @override
  State<Goal> createState() => _GoalState();
}

class _GoalState extends State<Goal> {

  List<String> items =[
    "Gain weight",
    "Lose weight",
    "Gain fitter",
    "Gain more flexible",
    "Learn the basic"
  ];

  @override
  Widget build(BuildContext context) {
    return Scroller(items: items, Gtext: "WHAT'S YOUR GOAL ?", Ptext: "THIS HELPS US CREATE YOUR PERSONALIZED PLAN", Ppath :"Height", Npath :"Level", Height: 100);
  }
}
