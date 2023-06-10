import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easyfitness/body/home/screens/Home.dart';
import 'package:easyfitness/body/notification/notification.dart';
import 'package:easyfitness/body/profil/profil.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Acceuil extends StatefulWidget {
  const Acceuil({Key? key}) : super(key: key);

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {


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
        //color: Color,
        animationDuration: Duration(milliseconds: 400),
        items: [
          Icon(Icons.home),
          Icon(Icons.notifications),
          Icon(Icons.person)
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
