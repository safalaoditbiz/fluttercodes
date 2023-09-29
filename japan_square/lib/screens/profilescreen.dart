import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:japan_square/screens/cartscreen.dart';
import 'package:japan_square/screens/homescreen.dart';
import 'package:japan_square/screens/loginscreen.dart';
import 'package:japan_square/screens/orderscreen.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 40.0, left: 20, right: 20, bottom: 20),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage("assets/images/g72.png"),
                        height: 20,
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Profile",
                          style: TextStyle(
                              color: Color(0xff393D40),
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 130,
            width: 360,
            color: Color(0xff681A1E),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "G7 Mobiles",
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Loginscreen()));
                      },
                      icon: Image.asset(
                        "assets/images/logout.png",
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, bottom: 20, top: 15),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff000000), width: 0.25),
                  borderRadius: BorderRadius.circular(8)),
              child: ExpansionTile(
                iconColor: Color(0xff393D40),
                collapsedIconColor: Color(0xff393D40),
                title: Padding(
                  padding: const EdgeInsets.only(top: 02.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Image.asset("assets/images/lock.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Change Password",
                          style: TextStyle(
                              color: Color(0xff6C6C6C),
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              fontStyle: FontStyle.normal),
                        ),
                      )
                    ],
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, bottom: 20, top: 10),
                    child: Container(
                      height: 45,
                      width: 320,
                      child: TextFormField(
                        cursorColor: Color(0xff6C6C6C),
                        decoration: InputDecoration(
                          labelText: "New Password",
                          labelStyle: TextStyle(
                              color: Color(0xff6C6C6C),
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              fontStyle: FontStyle.normal),
                          prefixIcon: Image.asset(
                            "assets/images/lock.png",
                          ),
                          suffix: Image.asset(
                            "assets/images/eye.png",
                          ),

                          fillColor: Color(0xffF7F7F7),
                          // enabledBorder: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(8.0),
                          //   borderSide: BorderSide(
                          //       color: Color(0xff000000), width: 0.25),
                          // ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff000000), width: 0.25),
                          ),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(8.0),
                          //   borderSide: BorderSide(
                          //       color: Color(0xff000000), width: 0.25),
                          // ),
                          //fillColor: Colors.green
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, bottom: 10),
                    child: Container(
                      height: 45,
                      //  width: 320,
                      child: TextFormField(
                        cursorColor: Color(0xff6C6C6C),
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(
                              color: Color(0xff6C6C6C),
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              fontStyle: FontStyle.normal),
                          prefixIcon: Image.asset(
                            "assets/images/lock.png",
                          ),
                          suffix: Image.asset(
                            "assets/images/eye.png",
                          ),
                          fillColor: Color(0xffF7F7F7),
                          focusColor: Colors.grey,
                          hoverColor: Colors.grey,
                          //   enabledBorder: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(8.0),
                          //     borderSide: BorderSide(
                          //         color: Color(0xff000000), width: 0.25),
                          //   ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff000000), width: 0.25),
                          ),
                          //   border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(8.0),
                          //     borderSide: BorderSide(
                          //         color: Color(0xff000000), width: 0.25),
                          //   ),
                          //   //fillColor: Colors.green
                          // ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomSheet: Container(
        color: Color(0xff681A1E),
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Homescreeen()));
                },
                icon: Image.asset(
                  "assets/images/home.png",
                  color: Color(0xffA8A8A8),
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                },
                icon: Image.asset(
                  "assets/images/cart.png",
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Orderscreen()));
                },
                icon: Image.asset("assets/images/order.png")),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Profilescreen()));
                },
                icon: Image.asset(
                  "assets/images/profile.png",
                  color: Color(0xffF7F7F7),
                )),
          ],
        ),
      ),
    );
  }
}
