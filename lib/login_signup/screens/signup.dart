import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  var _passwordToggle;
  var _confirmpasswordToggle;

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      final userId = FirebaseAuth.instance.currentUser?.uid;

      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(now);

      addUserDetails(
        _fnameController.text.trim(),
        _lnameController.text.trim(),
        _emailController.text.trim(),
        _passwordController.text.trim(),
        "",
        0,
        0,
        0,
        userId!,
        formattedDate,
      );
      Navigator.of(context).pushNamed('Gender');
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        wrongEmailMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.black12,
            title: Text(
              'Email already in use',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          );
        });
  }

  Future addUserDetails(
    String firstName,
    String lastName,
    String email,
    String password,
    String gender,
    int age,
    int height,
    int weight,
    String userId,
    String dateSignedUp,
  ) async {

    await FirebaseFirestore.instance.collection("Users").add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'password': password,
      'gender': gender,
      'age': age,
      'height': height,
      'weight': weight,
      'userId': userId,
      'dateSignedUp': dateSignedUp
    });
  }

  @override
  void dispose() {
    super.dispose();
    _fnameController.dispose();
    _lnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _passwordToggle = true;
    _confirmpasswordToggle = true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      height: 900,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/signup.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: ListView(children: [
          Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 220),
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
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: _fnameController,
                          cursorColor: Colors.lightGreen,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "First name",
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade600)),
                            labelStyle: TextStyle(color: Colors.grey.shade600),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "First name is required";
                            }
                          },
                        ),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: _lnameController,
                          cursorColor: Colors.lightGreen,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Last name",
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade600)),
                            labelStyle: TextStyle(color: Colors.grey.shade600),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Last name is required";
                            }
                          },
                        ),
                      )),
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
                                borderSide:
                                    BorderSide(color: Colors.grey.shade600)),
                            labelStyle: TextStyle(color: Colors.grey.shade600),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen)),
                          ),
                          validator: (value) {
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!);
                            if (value!.isEmpty) {
                              return "Email is required";
                            } else if (!emailValid) {
                              return "Enter a valid email";
                            }
                          },
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
                          obscureText: _passwordToggle,
                          cursorColor: Colors.lightGreen,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: "Password",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade600)),
                              labelStyle:
                                  TextStyle(color: Colors.grey.shade600),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.lightGreen)),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    _passwordToggle = !_passwordToggle;
                                  });
                                },
                                child: Icon(
                                  _passwordToggle
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: _passwordToggle
                                      ? Colors.grey
                                      : Colors.lightGreenAccent,
                                  size: 20,
                                ),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is required";
                            } else if (_passwordController.text.length < 6) {
                              return "Password length should be at least 6 characters";
                            }
                          },
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
                          obscureText: _confirmpasswordToggle,
                          cursorColor: Colors.lightGreen,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: "Confirm Password",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade600)),
                              labelStyle:
                                  TextStyle(color: Colors.grey.shade600),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.lightGreen)),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    _confirmpasswordToggle =
                                        !_confirmpasswordToggle;
                                  });
                                },
                                child: Icon(
                                  _confirmpasswordToggle
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: _confirmpasswordToggle
                                      ? Colors.grey
                                      : Colors.lightGreenAccent,
                                  size: 20,
                                ),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter to confirm your password";
                            }
                            if (_passwordController.text.trim() !=
                                _confirmpasswordController.text.trim()) {
                              return "Passwords do not match";
                            }
                          },
                        ),
                      )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Padding(
                    //  padding: const EdgeInsets.only(right: 5, bottom: 10),
                    //  child: Text(
                    //    _errorMessage,
                    //    style: TextStyle(
                    //       color: Colors.red,
                    //       fontSize: 11.5,
                    //       fontWeight: FontWeight.normal),
                    //),
                    //),
                    SizedBox(
                      height: 15,
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
                                if (_formKey.currentState!.validate()) {
                                  signUp();
                                }
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Sign up",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
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
                        SizedBox(
                          height: 100.0,
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ]),
      ),
    ));
  }
}
