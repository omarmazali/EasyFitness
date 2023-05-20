import 'package:easyfitness/onboarding_screen/onboard/screenOne.dart';
import 'package:easyfitness/onboarding_screen/onboard/screenThree.dart';
import 'package:easyfitness/onboarding_screen/onboard/screenTwo.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoard extends StatelessWidget {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(children: [
        SizedBox(
          height: 670,
          child: PageView(
            controller: _controller,
            children: [
              ScreenOne(),
              ScreenTwo(),
              ScreenThree(),
            ],
          ),
        ),
        SmoothPageIndicator(
            controller: _controller,
            count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: Colors.lightGreen,
            dotHeight: 7,
            dotWidth: 15,

          ),
        )
      ]),
    );
  }
}
