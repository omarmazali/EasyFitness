import 'package:easyfitness/scroller.dart';
import 'package:flutter/material.dart';

class Height extends StatefulWidget {
  const Height({Key? key}) : super(key: key);

  @override
  State<Height> createState() => _HeightState();
}

class _HeightState extends State<Height> {

  //IS THERE A SOLUTION TO SHOW CM ONLY ONCE
  List<String> items = List.generate(66, (index) => (index + 135).toString() + " cm");

  @override
  Widget build(BuildContext context) {
    return Scroller(items: items, Gtext:"WHAT'S YOUR HEIGHT ?", Ptext:"THIS HELPS US CREATE YOUR PERSONALIZED PLAN", Ppath :"Weight", Npath :"Goal", Height: 100);
  }
}
