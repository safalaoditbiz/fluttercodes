// ignore_for_file: deprecated_member_use

import 'package:educationapp/screens/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/screens/loginscreen.dart';
import 'package:educationapp/pages/login.dart';
import 'package:educationapp/pages/coding.dart';
import 'package:educationapp/pages/datascience.dart';

void main() {}

class coding extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(),
          child: Container(
            color: Colors.white,
            child: Text('select your intrest',
                style: TextStyle(
                  height: 3,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center),
          )),
      Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
          child: SizedBox(
              height: 60,
              child: RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => datascience()));
                  },
                  child: Column(// Replace with a Row for horizontal icon + text
                      children: <Widget>[
                    Icon(Icons.computer),
                    Text("datascience")
                  ])))),
      Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
          child: SizedBox(
              height: 60,
              child: RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => datascience()));
                  },
                  child: Column(// Replace with a Row for horizontal icon + text
                      children: <Widget>[Icon(Icons.book), Text("python")])))),
      Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
          child: SizedBox(
              height: 60,
              child: RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => datascience()));
                  },
                  child: Column(// Replace with a Row for horizontal icon + text
                      children: <Widget>[
                    Icon(Icons.train),
                    Text("flutter")
                  ])))),
    ]));
  }
}
