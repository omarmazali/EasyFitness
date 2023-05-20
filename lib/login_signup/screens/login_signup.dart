import 'package:easyfitness/login_signup/login.dart';
import 'package:easyfitness/login_signup/signup.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class LoginSignup extends StatefulWidget {
  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  final _controller = PageController();
  TutorialCoachMark? tutorialCoachMark;
  List<TargetFocus> targets = [];
  GlobalKey _indicatorKey = GlobalKey();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      showTutorialCoachMark();
    });
    super.initState();
  }

  void showTutorialCoachMark() {
    initTarget();
    tutorialCoachMark = TutorialCoachMark(
      targets: targets,
      pulseEnable: false,
    )..show(context: context);
  }

  void initTarget() {
    targets = [
      TargetFocus(
          identify: "indicator-key",
          keyTarget: _indicatorKey,
          shape: ShapeLightFocus.RRect,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              builder: (context, controller) {
                return CoachMarkDesc(
                  text:
                      "Don't have an account ? You can swipe left to create a new one",
                );
              },
            )
          ])
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          SizedBox(
            height: 670,
            child: PageView(
              controller: _controller,
              children: [Login(), Signup()],
            ),
          ),
          SmoothPageIndicator(
            key: _indicatorKey,
            controller: _controller,
            count: 2,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.lightGreen,
              dotHeight: 7,
              dotWidth: 15,
            ),
          )
        ],
      ),
    );
  }
}

class CoachMarkDesc extends StatefulWidget {
  const CoachMarkDesc({
    super.key,
    required this.text,
    this.skip = "",
    this.next = "",
    this.onSkip,
    this.onNext,
  });

  final String text;
  final String skip;
  final String next;
  final void Function()? onSkip;
  final void Function()? onNext;

  @override
  State<CoachMarkDesc> createState() => _CoachMarkDescState();
}

class _CoachMarkDescState extends State<CoachMarkDesc> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.text,
          ),
        ],
      ),
    );
  }
}
