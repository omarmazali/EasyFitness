import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      Navigator.of(context).pushNamed('Home');
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
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
                    "HELLO ROOKIES,",
                    style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
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
                    "ENTER YOUR INFORMATIONS BELOW OR",
                    style: TextStyle(
                        fontSize: 12.0,
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
                    "LOGIN WITH AN OTHER ACCOUNT",
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _confirmpasswordController,
                  cursorColor: Colors.lightGreen,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
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
              height: 25,
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
                        signUp();
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Sign up",
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
