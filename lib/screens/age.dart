import 'package:easyfitness/scroller.dart';
import 'package:flutter/material.dart';

class Age extends StatefulWidget {
  const Age({Key? key}) : super(key: key);

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {


  List<String> items = List.generate(66, (index) => (index + 15).toString() );


  @override
  Widget build(BuildContext context) {
    return Scroller(items: items, Gtext: "HOW OLD ARE YOU ?", Ptext: "THIS HELPS US CREATE YOUR PERSONALIZED PLAN",Ppath :"Gender", Npath :"Weight", Height: 100);
  }
}
