import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:mobileapp2/screens/login1.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/model.jpg"),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.only(top: 500, left: 20, right: 20),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login1(),
                              ));
                        }),
                        child: Container(
                          height: 50,
                          width: 260,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 106, top: 16),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.circular(40)),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        height: 50,
                        width: 260,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 106, top: 16),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.circular(40)),
                      )),
                ],
              ),
            )));
  }
}
