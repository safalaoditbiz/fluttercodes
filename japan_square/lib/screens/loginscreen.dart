import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:japan_square/screens/homescreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 0.0, top: 120, left: 99, right: 99),
                child: Container(
                    child: Image(
                  image: AssetImage("assets/images/g71.png"),
                  height: 197,
                  width: 163,
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 45,
                  width: 320,
                  child: TextFormField(
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: "User name",
                      labelStyle: TextStyle(
                          color: Color(0xff6C6C6C),
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          fontStyle: FontStyle.normal),
                      prefixIcon: Image.asset(
                        "assets/images/user.png",
                      ),

                      fillColor: Color(0xffF7F7F7),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff000000), width: 0.25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff000000), width: 0.25),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff000000), width: 0.25),
                      ),
                      //fillColor: Colors.green
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                child: Container(
                  height: 45,
                  width: 320,
                  child: TextFormField(
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                          color: Color(0xff6C6C6C),
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          fontStyle: FontStyle.normal),
                      prefixIcon: Image.asset(
                        "assets/images/lock.png",
                      ),
                      suffix: Image.asset(
                        "assets/images/eye.png",
                      ),

                      fillColor: Color(0xffF7F7F7),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff000000), width: 0.25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff000000), width: 0.25),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff000000), width: 0.25),
                      ),
                      //fillColor: Colors.green
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    height: 45,
                    width: 320,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: TextButton(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFF7F7F7)),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homescreeen()));
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xff681A1E)))),
              ),
              RichText(
                text: TextSpan(
                    text: 'Continue as a ',
                    style: TextStyle(
                        color: Color(0xff393D40),
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Guest?',
                          style: TextStyle(
                              color: Color(0xff681A1E),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Homescreeen()));
                            })
                    ]),
              ),
            ]),
      ),
    );
  }
}
