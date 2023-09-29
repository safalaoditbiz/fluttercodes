import 'package:flutter/material.dart';

import 'package:japan_square/screens/cartscreen.dart';
import 'package:japan_square/screens/homescreen2.dart';
import 'package:japan_square/screens/orderscreen.dart';
import 'package:japan_square/screens/profilescreen.dart';
import 'package:japan_square/screens/searchscreem.dart';

class Homescreeen extends StatefulWidget {
  const Homescreeen({super.key});

  @override
  State<Homescreeen> createState() => _HomescreeenState();
}

class _HomescreeenState extends State<Homescreeen> {
  List<Map<String, dynamic>> Homeitems = [
    {
      "title": "New Arrivals",
    },
    {"title": "Wireless Charger"},
    {"title": "Headsets"},
    {"title": "Neck Bands"},
    {"title": "Screen Guards"},
    {"title": "Back Covers"},
    {"title": "Wireless Charger"},
    {"title": "Headsets"},
    {"title": "Back Covers"},
    {"title": "Screen Guards"},
    {"title": "Screen Guards"},
    {"title": "Back Covers"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Image(
      //                   image: AssetImage("assets/images/logo1.png"),
      //                   height: 25,
      //                   width: 17,
      //                 ),

      //               title:   Padding(
      //                   padding: const EdgeInsets.only(left: 8.0),
      //                   child: Text(
      //                     "Home",
      //                     style: TextStyle(
      //                         color: Color(0xff393D40),
      //                         fontWeight: FontWeight.w400,
      //                         fontSize: 18,
      //                         fontStyle: FontStyle.normal),
      //                   ),
      //                 ),

      // ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
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
                          "Home",
                          style: TextStyle(
                              color: Color(0xff393D40),
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Searchscreen(),
                          ));
                    },
                    icon: Image(
                      image: AssetImage("assets/images/search.png"),
                      height: 18,
                      width: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 234, top: 30),
            child: Text(
              "Categories",
              style: TextStyle(
                  color: Color(0xff393D40),
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  fontStyle: FontStyle.normal),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  // physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0),
                  itemCount: Homeitems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homescreen2()));
                        },
                        child: Container(

                            // margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff393D401F), //New
                                  blurRadius: 2.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            height: 97,
                            width: 154,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, top: 12, right: 15),
                                    child: Container(
                                        height: 17,
                                        width: 124,
                                        child: Text(
                                          '${Homeitems[index]["title"]}',
                                          style: TextStyle(
                                              color: Color(0xff393D40),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              fontStyle: FontStyle.normal),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, right: 68, bottom: 12),
                                    child: Container(
                                      height: 14,
                                      width: 64,
                                      child: Text(
                                        "12products",
                                        style: TextStyle(
                                            color: Color(0xff393D40),
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                            fontStyle: FontStyle.normal),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.5,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 154,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(4.0),
                                        bottomLeft: Radius.circular(4.0),
                                      ),
                                      border: Border.all(
                                        color: Color(
                                            0xff393D401A), //color of border
                                        width: 0.5, //width of border
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 12.0),
                                          child: Text(
                                            "View Product",
                                            style: TextStyle(
                                                color: Color(0xff393D40),
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12,
                                                fontStyle: FontStyle.normal),
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: (() {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Homescreen2()));
                                            }),
                                            icon: Image.asset(
                                                "assets/images/eye.png")),
                                      ],
                                    ),
                                  )
                                ])));
                  }),
            ),
          ),
          SizedBox(
            height: 75,
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
                )),
          ],
        ),
      ),
    );
  }
}
