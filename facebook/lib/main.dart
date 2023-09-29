import 'package:facebook/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}
