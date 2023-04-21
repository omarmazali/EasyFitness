import 'package:easyfitness/screens/forgotpassword.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Verification extends StatefulWidget {

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                children: [
                  SizedBox(width: 20,),
                  SizedBox(
                    height: 40,
                    child: FloatingActionButton(
                      onPressed: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
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
              SizedBox(height: 150,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 27,),
                  Text(
                    "VERIFICATION",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'IntegralCF',
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 27,),
                  Text(
                    "CHECK YOUR EMAIL. WE'VE SENT YOU",
                    style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'IntegralCF',
                        fontWeight: FontWeight.normal,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 27,),
                  Text(
                    "THE PIN AT YOUR EMAIL.",
                    style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'IntegralCF',
                        fontWeight: FontWeight.normal,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
              SizedBox(height:40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 68,
                    width: 42.73,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length == 1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                          hintText: ".",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.bold,
                              fontSize: 40
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white12)
                          )
                      ),
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 42.73,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length == 1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                          hintText: ".",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.bold,
                              fontSize: 40
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white12)
                          )
                      ),
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 42.73,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length == 1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                          hintText: ".",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.bold,
                              fontSize: 40
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white12)
                          )
                      ),
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 42.73,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length == 1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                          hintText: ".",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.bold,
                              fontSize: 40
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white12)
                          )
                      ),
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 42.73,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length == 1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                          hintText: ".",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.bold,
                              fontSize: 40
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white12)
                          )
                      ),
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 42.73,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length == 1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                          hintText: ".",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.bold,
                              fontSize: 40
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white12)
                          )
                      ),
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height:80),
              Row(
                children: [
                  SizedBox(width: 120.0,),
                  RichText(
                      text: TextSpan(
                        text:  "Did you receive any code?",
                        style: TextStyle(
                          color : Colors.lightGreenAccent,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ForgotPassword(),
                              )),
                      )
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 275,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Verification(),
                        ));
                  },
                  child: Text(
                    'Verify',
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
