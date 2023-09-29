import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Appbarbutton extends StatelessWidget {
  final IconData buttonIcon;
  final void Function() buttonAction;
  Appbarbutton({
    required this.buttonIcon,
    required this.buttonAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 224, 224, 224), shape: BoxShape.circle),
      child: IconButton(
        icon: Icon(
          buttonIcon,
          color: Colors.black,
          size: 25,
        ),
        onPressed: buttonAction,
      ),
    );
  }
}
