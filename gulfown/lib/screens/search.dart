import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_4/screens/details.dart';
import 'package:flutter_application_4/screens/homescreen.dart';
import 'package:flutter_application_4/screens/login.dart';
import 'package:flutter_application_4/screens/profile.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: SafeArea(
          child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 40,
                width: 328,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      fillColor: Colors.grey,
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Search Product',
                      labelStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 35,
                          width: 25,
                          child: Image.asset(
                            "assets/images/search.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Search",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 206,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details()));
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)),
                          height: 206,
                          width: 160,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 4,
                                top: 4,
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4)),
                                    width: 59,
                                    height: 17,
                                    child: Text(
                                      "15% OFF",
                                      style: TextStyle(
                                          color: Color(0xff1FAF38),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    )),
                              ),
                              Positioned(
                                right: 8,
                                top: 10,
                                child: Container(
                                  width: 30,
                                  color: Colors.white,
                                  child: InkWell(
                                      child: Icon(
                                    Icons.favorite_border_rounded,
                                    color: Colors.black,
                                    size: 22,
                                  )),
                                ),
                              ),
                              Column(
                                children: [
                                  Image(
                                    image:
                                        AssetImage("assets/images/phone.png"),
                                    height: 124,
                                    width: 93,
                                  ),
                                  Container(
                                      margin: new EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        "Smartwatch with 1.4″ HD Screen Display,",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      )),
                                  Container(
                                      height: 20,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: new EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            height: 17,
                                            width: 138,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.currency_rupee,
                                                  size: 14,
                                                ),
                                                Text(
                                                  "12,0000 ",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  "14,000",
                                                  style: new TextStyle(
                                                    color: Colors.grey,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    height: 35,
                                                    width: 25,
                                                    child: Image.asset(
                                                      "assets/images/favor.png",
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Expanded(
                child: Column(
              children: [
                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Best Seller",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 206,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Details()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            margin: EdgeInsets.all(10),
                            height: 206,
                            width: 160,
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Container(
                                    width: 30,
                                    color: Colors.white,
                                    child: InkWell(
                                        child: Icon(
                                      Icons.favorite_border_rounded,
                                      color: Color.fromARGB(255, 105, 104, 104),
                                      size: 22,
                                    )),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Image(
                                      image:
                                          AssetImage("assets/images/phone.png"),
                                      height: 124,
                                      width: 93,
                                    ),
                                    Container(
                                        margin: new EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          "Smartwatch with 1.4″ HD Screen Display,",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        )),
                                    Container(
                                        height: 20,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: new EdgeInsets.symmetric(
                                                  horizontal: 8.0),
                                              height: 17,
                                              width: 138,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.currency_rupee,
                                                    size: 14,
                                                  ),
                                                  Text(
                                                    "12,0000 ",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    "14,000",
                                                    style: new TextStyle(
                                                      color: Colors.grey,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      height: 35,
                                                      width: 25,
                                                      child: Image.asset(
                                                        "assets/images/favor.png",
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ))
          ]))),

      //  GridView.count(
      //   crossAxisCount: 2,
      //   childAspectRatio: .8,
      //   crossAxisSpacing: 16,
      //   mainAxisSpacing: 60,
      //   children: [
      //     GridTile(
      //         child: GestureDetector(
      //       onTap: () {
      //         Navigator.pushReplacement(context,
      //             MaterialPageRoute(builder: (context) => Details()));
      //       },
      //       child: Image.network(
      //         'https://picsum.photos/250?image=9',
      //         height: 100,
      //       ),
      //     )),
      //     GridTile(
      //         child: GestureDetector(
      //       onTap: () {
      //         Navigator.pushReplacement(context,
      //             MaterialPageRoute(builder: (context) => Details()));
      //       },
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Container(
      //             height: 140,
      //             child: Image.network(
      //               'https://picsum.photos/250?image=9',
      //               fit: BoxFit.contain,
      //             ),
      //           ),
      //           Container(
      //               height: 20, child: Text("cfvgvbnjghjbnjhbnbm ")),
      //           Container(height: 20, child: Text("Rs 1000"))
      //         ],
      //       ),
      //     )),
      //     GridTile(
      //         child: GestureDetector(
      //       onTap: () {
      //         Navigator.pushReplacement(context,
      //             MaterialPageRoute(builder: (context) => Details()));
      //       },
      //       child: Image.network(
      //         'https://picsum.photos/250?image=9',
      //       ),
      //     )),
      //     GridTile(
      //         child: GestureDetector(
      //       onTap: () {
      //         Navigator.pushReplacement(context,
      //             MaterialPageRoute(builder: (context) => Details()));
      //       },
      //       child: Image.network(
      //         'https://picsum.photos/250?image=9',
      //       ),
      //     )),
      //   ],
      // ),
      //   )

      bottomSheet: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Homescreen()));
                },
                icon: Image.asset(
                  "assets/images/home2.png",
                  color: Color(0xffb636363),
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Search()));
                },
                icon: Image.asset(
                  "assets/images/search2.png",
                )),
            IconButton(
                onPressed: () {}, icon: Image.asset("assets/images/menu.png")),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
                icon: Image.asset(
                  "assets/images/iden2.png",
                )),
          ],
        ),
      ),
    );
  }
}
