import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 750,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/onboard3.png"),
              fit: BoxFit.cover,
          ),
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
                    "ACTION IS THE",
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
                    "KEY TO ALL SUCCESS",
                    style: TextStyle(
                        fontSize: 29.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 46,
              width: 160,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Colors.lightGreenAccent,
                  ),
                  onPressed: () {Navigator.of(context).pushReplacementNamed('LoginSignup');},
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Start now",
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
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
