import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  GlobalKey _signUpKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _passwordToggle;
  var _errorMessage;


  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      Navigator.of(context).pushNamed('Home');
    } on FirebaseAuthException catch (error) {
      _errorMessage = error.message!;
    }
  }
  Future signInGoogle() async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
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
  void initState() {
    super.initState();
    _passwordToggle = true;
    _errorMessage = "";

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 900,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/login.png"), fit: BoxFit.cover),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Form(
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
                            "WELCOME BACK,",
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
                            "YOU'VE BEEN MISSED",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
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
                                borderSide:
                                    BorderSide(color: Colors.grey.shade600)),
                            labelStyle: TextStyle(color: Colors.grey.shade600),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.lightGreen)),
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
                              labelStyle: TextStyle(color: Colors.grey.shade600),
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
                              return "Password is required";}}
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
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5, top: 10),
                      child: Text(
                        _errorMessage,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 11.5,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      height: 50,
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
                          onPressed: () {
                            signInGoogle();
                          },
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
                                  signIn();
                                }
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Login",
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
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
