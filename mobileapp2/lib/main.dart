import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobileapp2/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Color(0xffF5F5F5),
          fontFamily: 'AbrilFatface',
        ),
        home: Splashscreen());
  }
}
