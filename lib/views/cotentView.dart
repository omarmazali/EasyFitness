
import 'package:easyfitness/views/Home.dart';
import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
class ContentView extends StatefulWidget {
  const ContentView({Key? key}) : super(key: key);

  @override
  State<ContentView> createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  int _currentindex=0;
  setcurrentindex(int index){
    setState(() {
      _currentindex=index;
    });

  }
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,



      body: [
        HomePreviews(),

      ][_currentindex],

      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _currentindex,

        iconSize: 20,
        showElevation: false,
        onItemSelected: (index) => setState(() {
          _currentindex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home),
            title: Text('home'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.bar_chart),
            title: Text('Progresss'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),

        ],
      ),



    );
  }
}
