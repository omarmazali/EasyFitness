import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeTest extends StatefulWidget {
  const HomeTest({Key? key}) : super(key: key);

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  final user = FirebaseAuth.instance.currentUser!;
  final userId = FirebaseAuth.instance.currentUser?.uid;

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
        Text(user.uid!),
        MaterialButton(onPressed: () {
          signOut();
        },
        color: Colors.lightGreenAccent,
        child: Text("Sign out"),)
      ]),
    ));
  }
}
