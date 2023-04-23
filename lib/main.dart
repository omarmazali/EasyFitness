import 'package:easyfitness/auth.dart';
import 'package:easyfitness/screens/age.dart';
import 'package:easyfitness/screens/forgotpassword.dart';
import 'package:easyfitness/screens/gender.dart';
import 'package:easyfitness/screens/goal.dart';
import 'package:easyfitness/screens/height.dart';
import 'package:easyfitness/screens/home.dart';
import 'package:easyfitness/screens/level.dart';
import 'package:easyfitness/screens/login.dart';
import 'package:easyfitness/screens/login_signup.dart';
import 'package:easyfitness/screens/signup.dart';
import 'package:easyfitness/screens/verification.dart';
import 'package:easyfitness/screens/weight.dart';
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
      //home: LoginSignup(),

      routes: {
        '/': (context) => LoginSignup(),
        'Home': (context) => const Home(),
        'ForgotPassword': (context) => const ForgotPassword(),
        'Login': (context) => const Login(),
        'Signup': (context) => const Signup(),
        'Verification': (context) => Verification(),
        'Gender': (context) => const Gender(),
        'Age': (context) => const Age(),
        'Weight': (context) => Weight(),
        'Height': (context) => Height(),
        'Goal': (context) => Goal(),
        'Level': (context) => Level(),
      },
    );
  }
}
