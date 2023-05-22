import 'package:easyfitness/onboarding_screen/onboard/onboard.dart';
import 'package:easyfitness/login_signup/screens/age.dart';
import 'package:easyfitness/login_signup/screens/forgotpassword.dart';
import 'package:easyfitness/login_signup/screens/gender.dart';
import 'package:easyfitness/login_signup/screens/goal.dart';
import 'package:easyfitness/login_signup/screens/height.dart';
import 'package:easyfitness/login_signup/screens/level.dart';
import 'package:easyfitness/login_signup/screens/login_signup.dart';
import 'package:easyfitness/login_signup/screens/verification.dart';
import 'package:easyfitness/login_signup/screens/weight.dart';
import 'package:easyfitness/onboarding_screen/splash/splash_onboard.dart';
import 'package:easyfitness/splash_screen/splash.dart';
import 'package:easyfitness/body/home/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/body/home/data/data.dart';

int? initScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

        create: (context)=>WorkoutData(),
    child:MaterialApp(
      //home: LoginSignup(),



      debugShowCheckedModeBanner: false,
      initialRoute: initScreen == 0 || initScreen == null ? "SplashOnBoard" : "Splash",
      routes: {
        '/': (context) => SplashOnBoard(),
        'OnBoard': (context) => OnBoard(),
        'LoginSignup': (context) => LoginSignup(),
        'ForgotPassword': (context) => const ForgotPassword(),
        'Verification': (context) => Verification(),
        'Gender': (context) => const Gender(),
        'Age': (context) => const Age(),
        'Weight': (context) => Weight(),
        'Height': (context) => Height(),
        'Goal': (context) => Goal(),
        'Level': (context) => Level(),
        'Home': (context) => HomePreviews(),
        'Splash': (context) => const Splash(),
        'SplashOnBoard': (context) => const SplashOnBoard(),
      },
    ));
  }
}
