import 'package:easyfitness/body/login_signup/models/scrollerModel.dart';
import 'package:flutter/material.dart';

class Level extends StatefulWidget {
  const Level({Key? key}) : super(key: key);

  @override
  State<Level> createState() => _LevelState();
}

class _LevelState extends State<Level> {

  List<String> items =[
    "Sedentary - No exercise",
    "Lightly active - 1-3 days/week",
    "Moderately active - 3-5 days/week",
    "Very active - 6-7 days a week",
    "Extra active - Physical job"
  ];

  @override
  Widget build(BuildContext context) {
    return Scroller(name: 'level', items: items, Gtext: "YOUR REGULAR PHYSICAL ACTIVITY LEVEL", Ptext: "THIS HELPS US CREATE YOUR PERSONALIZED PLAN", Ppath :"Weight", Npath :"Acceuil", Height: 100, Size: 25, SizeBox: 70);
  }


}
