import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meals_app/screens/categoryscreen.dart';
import 'package:meals_app/screens/registerscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

const savelogin = '_userlogin';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // @override
  // void iniState() {
  //   checkuserLogin();
  //   super.initState();
  // }

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Do you want to exit?"),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            print('yes selected');
                            exit(0);
                          },
                          child: Text("Yes"),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffFA4A0C),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          print('no selected');
                          Navigator.of(context).pop();
                        },
                        child:
                            Text("No", style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
  //bool _isLoginOK = true;

  // void saveLoginInfo(String email, String password) async {
  Future<void> _login(BuildContext context) async {
    try {
      UserCredential login =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool(savelogin, true);
      final _userlogin = prefs.getBool(savelogin);
      log("use____+++++++++_-_" + _userlogin.toString());
      // saveLoginInfo(
      //     emailController.text.trim(), passwordController.text.trim());
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Categorysrceen(),
          ));
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Error'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(60),
            )),
            toolbarHeight: 250,
            backgroundColor: Color(0xffFA4A0C),
            centerTitle: true,
            title: Text(
              "Login your account",
              style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 28,
                  fontWeight: FontWeight.w900),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    cursorColor: Colors.black,
                    cursorWidth: 1,
                    enableInteractiveSelection: true,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                      //labelText: 'Email',
                      alignLabelWithHint: false,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFA4A0C))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFA4A0C))),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    cursorColor: Colors.black,
                    cursorWidth: 1,
                    controller: passwordController,
                    decoration: InputDecoration(
                        //  labelText: 'Password',
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                        alignLabelWithHint: false,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFA4A0C))),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFA4A0C))),
                        fillColor: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 3,
                            backgroundColor: const Color(0xffFA4A0C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          child: Text('Login'),
                          onPressed: () => _login(context),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              backgroundColor: Color(0xffFfffff),
                              foregroundColor: Color(0xffFA4A0C),
                            ),
                            child: Text('Register'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ));
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
