import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:philsa/screens/splashscreen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Color(0xffF5F5F5),
          fontFamily: 'Mukta Vaani',
        ),
        home: Splashscreen(),
      );
    });
  }
}
