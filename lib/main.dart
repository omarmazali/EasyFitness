import 'package:easyfitness/auth.dart';
import 'package:easyfitness/screens/forgotpassword.dart';
import 'package:easyfitness/screens/home.dart';
import 'package:easyfitness/screens/login.dart';
import 'package:easyfitness/screens/login_signup.dart';
import 'package:easyfitness/screens/signup.dart';
import 'package:easyfitness/screens/verification.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginSignup(),
      /*
      routes: {
        '/': (context) => Auth(),
        'Home': (context) => const Home(),
        'ForgotPassword': (context) => const ForgotPassword(),
        'Login': (context) => const Login(),
        'Signup': (context) => const Signup(),
        'Verification': (context) => Verification(),
      },
      */
    );
  }
}
