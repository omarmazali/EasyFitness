import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easyfitness/body/home/screens/Home.dart';
import 'package:easyfitness/body/notification/notification.dart';
import 'package:easyfitness/body/profil/profil.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({Key? key}) : super(key: key);

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  TutorialCoachMark? tutorialCoachMark;
  List<TargetFocus> targets = [];

  GlobalKey homeKey = GlobalKey();
  GlobalKey notificationsKey = GlobalKey();
  GlobalKey profilKey = GlobalKey();

  int _page = 0;
  final screens = [
    HomePreviews(),
    NotificationScreen(),
    Profil(),
  ];

  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      _showTutorialCoachMark();
    });
  }

  void _showTutorialCoachMark() {
    _initTarget();
    tutorialCoachMark = TutorialCoachMark(targets: targets,pulseEnable: false,)
      ..show(context: context);
  }

  void _initTarget() {
    targets = [
      TargetFocus(identify: "home-key", keyTarget: homeKey, contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return CoachMarkDesc(
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
                text:
                "Welcome to Easy Fitness! In this page you can find all the exercices that we did for you and the custom ones that you can create by yourself");
          },)
      ]),
      TargetFocus(identify: "notification-key", keyTarget: notificationsKey, contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return CoachMarkDesc(
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
                text:
                "Here you can find the information that you need to start your journey");
          },)
      ]),
      TargetFocus(identify: "profil-key", keyTarget: profilKey, contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return CoachMarkDesc(
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
                text:
                "And if you need to modify your profile, just click over here");
          },)
      ])
    ];
  }

  Future<void> _savePage(int index) async {
    setState(() {
      _page = index;
    });
    await _prefs.setInt('currentPage', index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.transparent,
        color: Color(0xFF2C2C2E),
        animationDuration: Duration(milliseconds: 400),
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          )
        ],
        onTap: (index) => _savePage(index),
        index: _page,
      ),
      body: IndexedStack(
        index: _page,
        children: screens,
      ),
    );
  }
}

class CoachMarkDesc extends StatefulWidget {
  const CoachMarkDesc({
    Key? key,
    required this.text,
    this.skip = "Skip",
    this.next = "Next",
    this.onSkip,
    this.onNext,
  }) : super(key: key);

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
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: widget.onSkip, child: Text(widget.skip, style: TextStyle(color: Colors.grey[900],))),
              SizedBox(
                width: 16,
              ),
              ElevatedButton(onPressed: widget.onNext, child: Text(widget.next), style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF2C2C2E)),
              ),)
            ],
          )
        ],
      ),
    );
  }
}