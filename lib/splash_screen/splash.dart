import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}


class _SplashState extends State<Splash> {

  bool animate = false;

  @override
  void initState(){
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
              top: animate ? 150 : 120,
              left: 140,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: animate ? 1 : 0,
                child: Container(
                    height: 130,
                    child: Image(
                      image: AssetImage("assets/dumbbell.png"),
                    )),
              )),
          Positioned(
              top: animate ? 400 : 370,
              left: 105,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: animate ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "EASY",
                      style: TextStyle(
                        color: Colors.lightGreenAccent,
                        fontSize: 50,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "FITNESS",
                      style: TextStyle(
                        color: Colors.lightGreenAccent,
                          fontSize: 50,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Future startAnimation() async{
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
     await Future.delayed(Duration(milliseconds: 5000));
    Navigator.of(context).pushReplacementNamed('LoginSignup');

  }
}
