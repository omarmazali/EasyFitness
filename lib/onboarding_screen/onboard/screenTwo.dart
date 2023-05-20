import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 750,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/onboard2.png"), fit: BoxFit.cover, ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(children: [
            SizedBox(height: 450,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "CREATE A WORKOUT PLAN",
                    style: TextStyle(
                        fontSize: 29.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TO STAY FIT",
                    style: TextStyle(
                        fontSize: 29.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            )]),
        ),
      ),
    );
  }
}
