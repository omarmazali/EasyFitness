import 'package:easyfitness/screens/login.dart';
import 'package:easyfitness/screens/signup.dart';
import "package:flutter/material.dart";

class LoginSignup extends StatefulWidget {
  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/login.png"), fit: BoxFit.cover),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.lightGreenAccent,
                        tabs: [
                          Container(
                            width: 35,
                            child: Tab(
                              child: Text("Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                  )),
                            ),
                          ),
                          Container(
                            child: Tab(
                              child: Text("Sign up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                  )),
                            ),
                          ),
                        ]),
                  ),
                  Flexible(
                    child: TabBarView(children: [Login(), Signup()]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
