import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_4/screens/login.dart';
import 'package:flutter_application_4/screens/login1.dart';
import 'package:flutter_application_4/screens/search.dart';
import 'package:lottie/lottie.dart';

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
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login1())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEE6983),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                  height: 200,
                  width: 200,
                  child: Lottie.asset("assets/lottie/splashlogo.json",
                      fit: BoxFit.contain)),
            ),
            Center(
              child: Container(
                height: 100,
                width: 100,
                child: Lottie.asset("assets/lottie/load.json",
                    fit: BoxFit.contain),
              ),
            )
          ],
        ));
  }
}

class Splashscreen3 extends StatefulWidget {
  const Splashscreen3({super.key});

  @override
  State<Splashscreen3> createState() => _Splashscreen3State();
}

class _Splashscreen3State extends State<Splashscreen3> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Search())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: 267,
        width: 328,
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 73,
                width: 73,
                child: Lottie.asset("assets/lottie/tick.json",
                    fit: BoxFit.contain),
              ),
            ),
            Text(
              "Payment Success!",
              style: TextStyle(
                  color: Color(0xff636363),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.currency_rupee),
                Text(
                  "12,0000",
                  style: TextStyle(
                      color: Color(0xff373737),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16),
              child: Divider(
                height: 0,
                color: Color(0xff636363),
                thickness: 0.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ref Number",
                    style: TextStyle(
                        color: Color(0xff636363),
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "000114114414",
                    style: TextStyle(
                        color: Color(0xff373737),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 20, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment Time",
                    style: TextStyle(
                        color: Color(0xff636363),
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "25-02-2022, 03:00 AM",
                    style: TextStyle(
                        color: Color(0xff373737),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment Method",
                    style: TextStyle(
                        color: Color(0xff636363),
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "Cash on Delivery",
                    style: TextStyle(
                        color: Color(0xff373737),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )

        // Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     SizedBox(
        //       height: 100,
        //     ),
        //     Center(
        //       child: Container(
        //           height: 200,
        //           width: 200,
        //           child: Lottie.asset("assets/lottie/splashlogo.json",
        //               fit: BoxFit.contain)),
        //     ),
        //     Center(
        //       child: Container(
        //         height: 100,
        //         width: 100,
        //         child: Lottie.asset("assets/lottie/load.json",
        //             fit: BoxFit.contain),
        //       ),
        //     )
        //   ],
        // )
        );
  }
}
