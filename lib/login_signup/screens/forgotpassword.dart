import 'package:easyfitness/login_signup/screens/login_signup.dart';
import 'package:easyfitness/login_signup/screens/verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _forgotPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      body: Container(
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 40,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginSignup(),
                        ));
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 25,
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey[800],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 27,
                  ),
                  Text(
                    "FORGOT PASSWORD?",
                    style: TextStyle(
                        fontSize: 32.0,
                        fontFamily: 'IntegralCF',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 27,
                  ),
                  Text(
                    "ENTER YOUR INFORMATIONS BELOW OR",
                    style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'IntegralCF',
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 27,
                  ),
                  Text(
                    "LOGIN WITH ANOTHER ACCOUNT",
                    style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'IntegralCF',
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 350,
                child: TextFormField(
                  controller: _forgotPasswordController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white12),
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 80),
              Row(
                children: [
                  SizedBox(
                    width: 155.0,
                  ),
                  RichText(
                      text: TextSpan(
                    text: "Try another way",
                    style: TextStyle(
                      color: Colors.lightGreenAccent,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ForgotPassword(),
                              )),
                  )),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 275,
                height: 46,
                child: ElevatedButton(
                  onPressed: () async {
                    var forgotEmail = _forgotPasswordController.text.trim();
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: forgotEmail)
                          .then((value) => {
                                print("Email sent"),
                                Navigator.of(context).pushNamed('LoginSignup'),
                              });
                    } on FirebaseAuthException catch (error) {
                      print("Error $error");
                    }
                  },
                  child: Text(
                    'Send',
                    style: TextStyle(
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Colors.lightGreenAccent,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
