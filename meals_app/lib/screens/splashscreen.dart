import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/screens/categoryscreen.dart';
import 'package:meals_app/screens/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async => await checkuserLogin());
  }

  Future<void> checkuserLogin() async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.setBool(savelogin, true);
    final _userlogin = prefs.getBool(savelogin);
    log("use____+++++++++_-_" + _userlogin.toString());
    if (_userlogin == null || _userlogin == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Categorysrceen(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image(
            image: AssetImage("assets/images/logo.png"),
            height: 160,
            width: 160,
          ),
        ));
  }
}
