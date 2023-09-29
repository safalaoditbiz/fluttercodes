import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_4/screens/cartscreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_4/screens/details.dart';
import 'package:flutter_application_4/screens/profile.dart';
import 'package:flutter_application_4/screens/search.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> imgList = [
    "assets/images/headset.png",
    "assets/images/headset.png",
    "assets/images/headset.png",
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 120,
        backgroundColor: Color(0xffF5F5F5),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image.asset(
            "assets/images/gulfown.png",
            height: 28,
            width: 99,
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Cartscreen()));
              },
              icon: Image(
                image: AssetImage("assets/images/bag.png"),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 138,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                  items: imgList
                      .map(
                        (e) => Container(
                          margin: const EdgeInsets.all(0),
                          child: Image.asset(
                            e,
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 16 / 16,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                height: 85,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.pushReplacement(context,
                          //     MaterialPageRoute(builder: (context) => Details()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(children: [
                            Image(
                              image: AssetImage("assets/images/phone.png"),
                              height: 40,
                              width: 40,
                            ),
                            Text(
                              "Mobiles",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff636363)),
                            )
                          ]),
                        ),
                      );
                    }),
              ),
            ),
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Text(
                      "Latest Product",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color(0xff2F2F2F)),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
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
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              height: 206,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Details()));
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
                                  image: AssetImage("assets/images/phone.png"),
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: AssetImage("assets/images/sale2.png"),
                    height: 67,
                    width: 154,
                  ),
                  Image(
                    image: AssetImage("assets/images/sale.png"),
                    height: 67,
                    width: 154,
                  ),
                ],
              ),
            ),
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Treding Products",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color(0xff2F2F2F)),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
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
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              height: 206,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Details()));
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
                                  image: AssetImage("assets/images/phone.png"),
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
            Image(
              image: AssetImage("assets/images/sale.png"),
              height: 135,
              width: 328,
            ),
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Text(
                      "Suggestion",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color(0xff2F2F2F)),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
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
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              height: 206,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Details()));
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
                                  image: AssetImage("assets/images/phone.png"),
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: AssetImage("assets/images/sale2.png"),
                    height: 67,
                    width: 154,
                  ),
                  Image(
                    image: AssetImage("assets/images/sale.png"),
                    height: 67,
                    width: 154,
                  ),
                ],
              ),
            ),
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Offer Products",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color(0xff2F2F2F)),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
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
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              height: 206,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Details()));
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
                                  image: AssetImage("assets/images/phone.png"),
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
            Image(
              image: AssetImage("assets/images/sale.png"),
              height: 135,
              width: 328,
            ),
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Text(
                      "Brand Products",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color(0xff2F2F2F)),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
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
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              height: 206,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Details()));
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
                                  image: AssetImage("assets/images/phone.png"),
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: AssetImage("assets/images/sale2.png"),
                    height: 67,
                    width: 154,
                  ),
                  Image(
                    image: AssetImage("assets/images/sale.png"),
                    height: 67,
                    width: 154,
                  ),
                ],
              ),
            ),
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Offer Products",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color(0xff2F2F2F)),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
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
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              height: 206,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Details()));
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
                                  image: AssetImage("assets/images/phone.png"),
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
            Image(
              image: AssetImage("assets/images/sale.png"),
              height: 135,
              width: 328,
            ),
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Text(
                      "Recently Viewed",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color(0xff2F2F2F)),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
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
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              height: 206,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Details()));
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
                                  image: AssetImage("assets/images/phone.png"),
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: AssetImage("assets/images/sale2.png"),
                    height: 67,
                    width: 154,
                  ),
                  Image(
                    image: AssetImage("assets/images/sale.png"),
                    height: 67,
                    width: 154,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
                  "assets/images/home.png",
                  color: Color(0XFFEE6983),
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Search()));
                },
                icon: Image.asset(
                  "assets/images/search.png",
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

  Widget carousalDots({required int index}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 12,
            width: 12,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: currentIndex == index ? Colors.red : Colors.grey,
                  width: 1,
                )),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index ? Colors.red : Colors.grey,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
