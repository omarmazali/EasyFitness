import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  void openForgotPassword() {
    Navigator.of(context).pushReplacementNamed('ForgotPassword');
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 150),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "WELCOME BACK,",
                    style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "OMAR",
                    style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 65,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _emailController,
                  cursorColor: Colors.lightGreen,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Email",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600)),
                    labelStyle: TextStyle(color: Colors.grey.shade600),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightGreen)),
                  ),
                ),
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _passwordController,
                  cursorColor: Colors.lightGreen,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Password",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600)),
                    labelStyle: TextStyle(color: Colors.grey.shade600),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightGreen)),
                  ),
                ),
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Forgot password",
                      style: TextStyle(
                        color: Colors.lightGreenAccent,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.normal,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = openForgotPassword,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.apple,
                    color: Colors.white,
                    size: 30,
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Colors.grey[800]),
                ),
                SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: ImageIcon(
                    AssetImage("assets/google.png"),
                    size: 30,
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Colors.grey[800]),
                ),
                SizedBox(
                  width: 85.0,
                ),
                SizedBox(
                  height: 46,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.lightGreenAccent,
                      ),
                      onPressed: () {
                        signIn;
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right,
                            size: 30.0,
                            color: Colors.black,
                          ),
                        ],
                      )
                      //foregroundColor: Colors.black,
                      //backgroundColor: Colors.lightGreenAccent,
                      ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
