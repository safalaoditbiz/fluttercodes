import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:japan_square/screens/homescreen.dart';

class Successscreen extends StatelessWidget {
  const Successscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 250),
          child: Container(
            height: 214,
            width: 320,
            decoration: BoxDecoration(
              color: Color(0xff681A1E),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      height: 22,
                      width: 22,
                      child: Image.asset("assets/images/tick.png",
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Order Successfully Placed",
                    style: TextStyle(
                        color: Color(0xffF7F7F7),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                  child: Divider(
                    height: 0,
                    color: Color(0xffF7F7F7),
                    thickness: 0.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order ID:",
                        style: TextStyle(
                            color: Color(0xffD7D7D7),
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "#454455445",
                        style: TextStyle(
                            color: Color(0xffF7F7F7),
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
                        "Order Date:",
                        style: TextStyle(
                            color: Color(0xffD7D7D7),
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "12/12/2023",
                        style: TextStyle(
                            color: Color(0xffF7F7F7),
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
                        "Total:",
                        style: TextStyle(
                            color: Color(0xffD7D7D7),
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "1850",
                        style: TextStyle(
                            color: Color(0xffF7F7F7),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 188.0, left: 100),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 14,
                ),
                onPressed: (() {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Homescreeen()));
                }),
              ),
              Text(
                "Back Home",
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xff393D40)),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
