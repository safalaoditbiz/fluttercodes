import 'package:flutter/material.dart';
import 'package:japan_square/screens/cartscreen.dart';
import 'package:japan_square/screens/detailscreen.dart';
import 'package:japan_square/screens/homescreen.dart';
import 'package:japan_square/screens/orderscreen.dart';
import 'package:japan_square/screens/profilescreen.dart';

class Homescreen2 extends StatefulWidget {
  @override
  State<Homescreen2> createState() => _Homescreen2State();
}

class _Homescreen2State extends State<Homescreen2> {
  int _itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Row(
                //   children: [
                //     Image(
                //       image: AssetImage("assets/images/logo1.png"),
                //       height: 25,
                //       width: 17,
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 8.0),
                //       child: Text(
                //         "Home",
                //         style: TextStyle(
                //             color: Color(0xff393D40),
                //             fontWeight: FontWeight.w400,
                //             fontSize: 18,
                //             fontStyle: FontStyle.normal),
                //       ),
                //     ),
                //   ],
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 280.0),
                //   child: Image(
                //     image: AssetImage("assets/images/search.png"),
                //     height: 18,
                //     width: 18,
                //   ),
                // ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 14,
                      ),
                      onPressed: (() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homescreeen()));
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text(
                        "New Arrivals",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Color(0xff393D40)),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    "Clear item",
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff6C6C6C)),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 99,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xff0000004D),
                            width: 0.25,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff393D401F),
                              blurRadius: 2.0,
                            )
                          ],
                        ),
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Detailscreen()));
                            debugPrint('Card tapped.');
                          },
                          child: Row(
                            children: [
                              Container(
                                  height: 53,
                                  width: 53,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/headset.png")),
                                  )),
                              Container(
                                  width: 180,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,

                                      // ignore: sort_child_properties_last
                                      children: [
                                        Text(
                                          "Fire Bolt Watches",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color(0xff393D40)),
                                        ),
                                        Text(
                                          "MRP: 12321",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12,
                                              color: Color(0xff681A1E)),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Quanty:",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12,
                                                  color: Color(0xff393D40)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    border: Border.all(
                                                      width: 0.25,
                                                    ),
                                                  ),
                                                  height: 26,
                                                  width: 117,
                                                  child: Row(children: [
                                                    Container(
                                                      width: 26,
                                                      child: IconButton(
                                                          icon: const Icon(
                                                            Icons.remove,
                                                            size: 12,
                                                          ),
                                                          onPressed: () {}),
                                                    ),
                                                    Container(
                                                      height: 26,
                                                      width: 63,
                                                      decoration: BoxDecoration(
                                                        border: Border(
                                                          left: BorderSide(
                                                            width: 0.25,
                                                          ),
                                                          right: BorderSide(
                                                            width: 0.25,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 30.0,
                                                                top: 6),
                                                        child: Text(
                                                          "0",
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 12,
                                                              color: Color(
                                                                  0xff393D40)),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 26,
                                                      child: IconButton(
                                                          icon: const Icon(
                                                            Icons.add,
                                                            size: 12,
                                                          ),
                                                          onPressed: () {}),
                                                    ),
                                                  ])),
                                            ),
                                          ],
                                        ),
                                      ])),
                              Column(
                                //xisAlignment: MainAxisAlignment.se,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 34.0),
                                    child: Text(
                                      "S Rate:4500",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                          color: Color(0xff035811)),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: (() {
                                        // Navigator.pushReplacement(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             Homescreen2()));
                                      }),
                                      icon: Image.asset(
                                          "assets/images/cart2.png")),
                                ],
                              )
                            ],
                          ),
                        )),
                  )),
        ),
      ]),
      bottomSheet: Container(
        color: Color(0xff681A1E),
        height: 130,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Total Price:",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 14,
                            fontWeight: FontWeight.w100),
                      ),
                      Text(
                        " 54554",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      height: 27,
                      width: 100,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFFF5F5F5)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ))),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartScreen()));
                        },
                        child: Text(
                          "Check Out",
                          style: TextStyle(
                              color: Color(0xff035811),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homescreeen()));
                      },
                      icon: Image.asset(
                        "assets/images/home.png",
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartScreen()));
                      },
                      icon: Image.asset(
                        "assets/images/cart.png",
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Orderscreen()));
                      },
                      icon: Image.asset("assets/images/order.png")),
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profilescreen()));
                      },
                      icon: Image.asset(
                        "assets/images/profile.png",
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
