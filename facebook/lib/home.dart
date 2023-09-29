import 'package:facebook/appbarbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "facebook",
          style: TextStyle(
              color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Appbarbutton(buttonIcon: Icons.search, buttonAction: (() {})),
          Appbarbutton(buttonIcon: Icons.chat, buttonAction: (() {})),
        ],
      ),
    );
  }
}
