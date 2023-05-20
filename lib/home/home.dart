import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser!;

  Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushNamed('LoginSignup');
    } on FirebaseAuthException catch (error) {
      print("Error $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Hello, You're signed in"),
        Text(user.email!),
        MaterialButton(onPressed: () {
          signOut();
        },
        color: Colors.lightGreenAccent,
        child: Text("Sign out"),)
      ]),
    ));
  }
}
