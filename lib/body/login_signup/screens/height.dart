import 'package:easyfitness/body/login_signup/models/scrollerModel.dart';
import 'package:flutter/material.dart';

class Height extends StatefulWidget {
  const Height({Key? key}) : super(key: key);

  @override
  State<Height> createState() => _HeightState();
}

class _HeightState extends State<Height> {

  //IS THERE A SOLUTION TO SHOW CM ONLY ONCE
  List<String> items = List.generate(66, (index) => (index + 135).toString());

  @override
  Widget build(BuildContext context) {
    return Scroller(name: 'height',items: items, Gtext:"WHAT'S YOUR HEIGHT ?", Ptext:"THIS HELPS US CREATE YOUR PERSONALIZED PLAN", Ppath :"Weight", Npath :"Acceuil", Height: 100, Size: 40, SizeBox: 100,);
  }
}
