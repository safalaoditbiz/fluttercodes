import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobileapp2/screens/homescreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Homescreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/model.jpg"), fit: BoxFit.cover)),
      child: const Center(
        child: Image(
          image: AssetImage("assets/images/splash.png"),
          height: 80,
          width: 80,
        ),
      ),
    ));
  }
}
