import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/screens/cartscreen.dart';
import 'package:flutter_application_4/screens/search.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  showAlertDialog(BuildContext context) {}

  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<String> imgList = [
    "assets/images/phone.png",
    "assets/images/phone.png",
    "assets/images/phone.png",
    "assets/images/phone.png",
  ];
  int currentIndex = 0;
  bool isExpanded1 = false;

  showAlertDialog(BuildContext context) {
    AlertDialog alert =
        AlertDialog(title: Text("hi"), content: TextFormField());

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xFFF5F5F5),
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back, color: Colors.black),
            //   onPressed: () => Navigator.of(context).pop(),
            // ),
            leading: Padding(
              padding: const EdgeInsets.all(14.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Search()));
                },
                child: SafeArea(
                  child: Container(
                    height: 5,
                    width: 5,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                ),
              ),
            )),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Stack(children: [
                    Positioned(
                      top: 10,
                      right: 1,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.favorite_border_rounded,
                            color: Color(0xFF636363),
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      right: 1,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.share,
                            color: Color(0xFF636363),
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: CarouselSlider(
                          items: imgList
                              .map(
                                (e) => Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    e,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              )
                              .toList(),
                          options: CarouselOptions(
                            height: 400,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.8,
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

                      // PageView.builder(
                      // itemCount: 4,
                      // pageSnapping: true,
                      // onPageChanged: (page) {},
                      // itemBuilder: (context, pagePosition) {
                      //   return Container(
                      //     margin: EdgeInsets.all(10),
                      //     child: Image.asset(
                      //       "assets/images/phone.png",
                      //       fit: BoxFit.contain,
                      //     ),
                      //   );
                      // }),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      imgList.length, (index) => carousalDots(index: index)),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8.0, left: 8, top: 14),
                  child: Text(
                    "Smartwatch with 1.4″  BBBoat    HD Screen Display, SpO  Sensor, Multiple Watch Faces, Dynamic Heart Rate Monitoring, and much more...",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.currency_rupee,
                                color: Colors.redAccent,
                                size: 14,
                              ),
                              const Text(
                                "3,999 ",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFFEE6983),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: new EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "12,000",
                              style: new TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ),
                          Container(
                            margin: new EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "81% OFF",
                              style: new TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFEE6983),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    bottom: 10.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        const Text(
                          "Expected Delivery : ",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0Xff636363),
                              fontWeight: FontWeight.w400),
                        ),
                        const Text(
                          "13-Apr,Thu- 17-Apr,Mon",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF1FAF38),
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    // height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xff37373766),
                        width: 0.25,
                      ),
                      color: const Color(0xffFFFFFF),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "key Features",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 9),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    size: 10,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "1.4 inch Screen, Full Touch Control",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff373737),
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    size: 10,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 48,
                                    width: 290,
                                    child: const Text(
                                      "Accurate SpO2, Heart Rate Tracking | Steps Tracking, Multiple Sports Mode, Sleep Tracking, Multiple Watch Faces",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff373737),
                                          fontWeight: FontWeight.w300),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    size: 10,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "Battery Runtime: Upto 8 days",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff373737),
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    size: 10,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 290,
                                    child: const Text(
                                      " Superior Nordic ChipsetRobust Bluetooth connectivity ",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff373737),
                                          fontWeight: FontWeight.w300),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 1.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      size: 10,
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    const Text(
                                      " security",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff373737),
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ),
                            ]))),
                Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: isExpanded1 ? 328 : 41,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        border: Border.all(
                          color: const Color(0xff37373766),
                          width: 0.25,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: isExpanded1
                          ? SingleChildScrollView(
                              // physics: const NeverScrollableScrollPhysics(),
                              child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Specifications"),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isExpanded1 = !isExpanded1;
                                            });
                                          },
                                          child: const Icon(
                                            Icons.remove_circle_outline,
                                            size: 20,
                                            color: Color(0xff373737),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 10,
                                      color: Color(0xff63636380),
                                      thickness: 1,
                                    ),
                                    Text(
                                      "Audio & Video Features",
                                      style: TextStyle(
                                          color: Color(0xffEE6983),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Divider(
                                      height: 10,
                                      color: Color(0xff63636380),
                                      thickness: 1,
                                    ),
                                    Container(
                                      height: 30,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Audio Features",
                                            style: TextStyle(
                                                color: Color(0xff636363),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            ":",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff636363),
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Container(
                                            height: 40,
                                            width: 170,
                                            child: Text(
                                              "Playing Music Through the Watch Via the Inbuild Speaker",
                                              style: TextStyle(
                                                  color: Color(0xff636363),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Audio Features",
                                            style: TextStyle(
                                                color: Color(0xff636363),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            ":",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff636363),
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Container(
                                            height: 40,
                                            width: 170,
                                            child: Text(
                                              "Playing Music Through the Watch Via the Inbuild Speaker",
                                              style: TextStyle(
                                                  color: Color(0xff636363),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 10,
                                      color: Color(0xff63636380),
                                      thickness: 1,
                                    ),
                                    Text(
                                      "Audio & Video Features",
                                      style: TextStyle(
                                          color: Color(0xffEE6983),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Divider(
                                      height: 10,
                                      color: Color(0xff63636380),
                                      thickness: 1,
                                    ),
                                    Container(
                                      height: 30,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Audio Features",
                                            style: TextStyle(
                                                color: Color(0xff636363),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            ":",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff636363),
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Container(
                                            height: 40,
                                            width: 170,
                                            child: Text(
                                              "Playing Music Through the Watch Via the Inbuild Speaker",
                                              style: TextStyle(
                                                  color: Color(0xff636363),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 10,
                                      color: Color(0xff63636380),
                                      thickness: 1,
                                    ),
                                    Text(
                                      "Audio & Video Features",
                                      style: TextStyle(
                                          color: Color(0xffEE6983),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Divider(
                                      height: 10,
                                      color: Color(0xff63636380),
                                      thickness: 1,
                                    ),
                                    Container(
                                      height: 30,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Audio Features",
                                            style: TextStyle(
                                                color: Color(0xff636363),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            ":",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff636363),
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Container(
                                            height: 40,
                                            width: 170,
                                            child: Text(
                                              "Playing Music Through the Watch Via the Inbuild Speaker",
                                              style: TextStyle(
                                                  color: Color(0xff636363),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 10,
                                      color: Color(0xff63636380),
                                      thickness: 1,
                                    ),
                                    Text(
                                      "Audio & Video Features",
                                      style: TextStyle(
                                          color: Color(0xffEE6983),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Divider(
                                      height: 10,
                                      color: Color(0xff63636380),
                                      thickness: 1,
                                    ),
                                    Container(
                                      height: 30,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Audio Features",
                                            style: TextStyle(
                                                color: Color(0xff636363),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            ":",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff636363),
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Container(
                                            height: 40,
                                            width: 170,
                                            child: Text(
                                              "Playing Music Through the Watch Via the Inbuild Speaker",
                                              style: TextStyle(
                                                  color: Color(0xff636363),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 10,
                                      color: Color(0xff63636380),
                                      thickness: 1,
                                    ),
                                    Text(
                                      "Audio & Video Features",
                                      style: TextStyle(
                                          color: Color(0xffEE6983),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Divider(
                                      height: 10,
                                      color: Color(0xff63636380),
                                      thickness: 1,
                                    ),
                                    Container(
                                      height: 30,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Audio Features",
                                            style: TextStyle(
                                                color: Color(0xff636363),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            ":",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff636363),
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Container(
                                            height: 40,
                                            width: 170,
                                            child: Text(
                                              "Playing Music Through the Watch Via the Inbuild Speaker",
                                              style: TextStyle(
                                                  color: Color(0xff636363),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Audio Features",
                                            style: TextStyle(
                                                color: Color(0xff636363),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            ":",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff636363),
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Container(
                                            height: 40,
                                            width: 170,
                                            child: Text(
                                              "Playing Music Through the Watch Via the Inbuild Speaker",
                                              style: TextStyle(
                                                  color: Color(0xff636363),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 10,
                                      color: Color(0xff63636380),
                                      thickness: 1,
                                    ),
                                    Text(
                                      "Audio & Video Features",
                                      style: TextStyle(
                                          color: Color(0xffEE6983),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Divider(
                                      height: 10,
                                      color: Color(0xff63636380),
                                      thickness: 1,
                                    ),
                                    Container(
                                      height: 30,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Audio Features",
                                            style: TextStyle(
                                                color: Color(0xff636363),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            ":",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff636363),
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Container(
                                            height: 40,
                                            width: 170,
                                            child: Text(
                                              "Playing Music Through the Watch Via the Inbuild Speaker",
                                              style: TextStyle(
                                                  color: Color(0xff636363),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ))
                          : Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffFFFFFF),
                                border: Border.all(
                                  color: const Color(0xff37373766),
                                  width: 0.25,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 41,
                              width: 328,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Specifications"),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isExpanded1 = !isExpanded1;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.add_circle_outline,
                                        size: 20,
                                        color: Color(0xff373737),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // ),
                            ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: const Color(0xffFFFFFF),
                      //     border: Border.all(
                      //       color: const Color(0xff37373766),
                      //       width: 0.25,
                      //     ),
                      //     borderRadius: BorderRadius.circular(12),
                      //   ),
                      //   height: 41,
                      //   width: 328,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         const Text("Specifications"),
                      //         const Icon(
                      //           Icons.add_circle_outline,
                      //           size: 20,
                      //           color: Color(0xff373737),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      border: Border.all(
                        color: const Color(0xff37373766),
                        width: 0.25,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 41,
                    width: 328,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Rating & reviews"),
                            InkWell(
                              onTap: () {
                                // show the dialog
                                showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        topLeft: Radius.circular(12)),
                                  ),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 201,
                                      width: 360,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16,
                                                          right: 16,
                                                          bottom: 12),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        "Rating & reviews",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff373737),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      InkWell(
                                                        onTap: () {},
                                                        child: const Icon(
                                                          Icons
                                                              .remove_circle_outline,
                                                          size: 18,
                                                          color:
                                                              Color(0xff373737),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16.0,
                                                          right: 16),
                                                  child: Container(
                                                    height: 61,
                                                    width: 330,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color:
                                                            Color(0xff37373766),
                                                        width: 0.5,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      color: Colors.white,
                                                    ),
                                                    child: TextField(
                                                      cursorColor: Colors.black,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                top: 12.0,
                                                                left: 15),
                                                        fillColor: Colors.grey,
                                                        border:
                                                            InputBorder.none,
                                                        labelText: 'Type Here',
                                                        labelStyle: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color:
                                                              Color(0xff636363),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                    child: Container(
                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        IconButton(
                                                            onPressed: () {},
                                                            icon: Image.asset(
                                                                "assets/images/star1.png")),
                                                        IconButton(
                                                            onPressed: () {},
                                                            icon: Image.asset(
                                                                "assets/images/star1.png")),
                                                        IconButton(
                                                            onPressed: () {},
                                                            icon: Image.asset(
                                                                "assets/images/star1.png")),
                                                        IconButton(
                                                            onPressed: () {},
                                                            icon: Image.asset(
                                                                "assets/images/star2.png")),
                                                        IconButton(
                                                            onPressed: () {},
                                                            icon: Image.asset(
                                                                "assets/images/star2.png")),
                                                      ]),
                                                )),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 100),
                                                  height: 35,
                                                  width: 174,
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(const Color(
                                                                    0xFFEE6983)),
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ))),
                                                    child: const Text(
                                                      'Submit',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              0xFFF5F5F5)),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ]),
                                    );
                                  },
                                );
                              },
                              child: const Icon(
                                Icons.add_circle_outline,
                                size: 20,
                                color: Color(0xff373737),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      border: Border.all(
                        color: const Color(0xff37373766),
                        width: 0.25,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 41,
                    width: 328,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "FAQ",
                              style: TextStyle(
                                  color: Color(0xff373737),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            InkWell(
                              onTap: () {
                                // show the dialog
                                showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        topLeft: Radius.circular(12)),
                                  ),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 201,
                                      width: 360,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16,
                                                          right: 16,
                                                          bottom: 12),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        "FAQ",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff373737),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      InkWell(
                                                        onTap: () {},
                                                        child: const Icon(
                                                          Icons
                                                              .remove_circle_outline,
                                                          size: 18,
                                                          color:
                                                              Color(0xff373737),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16.0,
                                                          right: 16,
                                                          bottom: 10),
                                                  child: Container(
                                                    height: 93,
                                                    width: 330,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color:
                                                            Color(0xff37373766),
                                                        width: 0.5,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      color: Colors.white,
                                                    ),
                                                    child: TextField(
                                                      cursorColor: Colors.black,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                top: 12.0,
                                                                left: 15),
                                                        fillColor: Colors.grey,
                                                        border:
                                                            InputBorder.none,
                                                        labelText:
                                                            'Type Simple Questions',
                                                        labelStyle: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color:
                                                              Color(0xff636363),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 100),
                                                  height: 35,
                                                  width: 174,
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(const Color(
                                                                    0xFFEE6983)),
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ))),
                                                    child: const Text(
                                                      'Submit',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              0xFFF5F5F5)),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ]),
                                    );
                                  },
                                );
                              },
                              child: const Icon(
                                Icons.add_circle_outline,
                                size: 20,
                                color: Color(0xff373737),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Dazzling Display",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff373737)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "A full touch HD display, optical heart rate monitor, and IPX7 waterproof rating make the Fire-Boltt BSW001 smartwatch an ideal device for timekeeping as well as health tracking. This smartwatch offers up to eight days of battery life, ",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Dazzling Display",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff373737)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "A full touch HD display, optical heart rate monitor, and IPX7 waterproof rating make the Fire-Boltt BSW001 smartwatch an ideal device for timekeeping as well as health tracking. This smartwatch offers up to eight days of battery life, ",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Dazzling Display",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff373737)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "A full touch HD display, optical heart rate monitor, and IPX7 waterproof rating make the Fire-Boltt BSW001 smartwatch an ideal device for timekeeping as well as health tracking. This smartwatch offers up to eight days of battery life, ",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Dazzling Display",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff373737)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "A full touch HD display, optical heart rate monitor, and IPX7 waterproof rating make the Fire-Boltt BSW001 smartwatch an ideal device for timekeeping as well as health tracking. This smartwatch offers up to eight days of battery life, ",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(
                  height: 120,
                )
              ],
            ),
          ),
        )),
        bottomSheet: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 154.0,
                          height: 35.0,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFFF5F5F5)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ))),
                            child: const Text(
                              'Add To Cart ',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFEE6983)),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Cartscreen()));
                            },
                          ),
                        ),
                        new SizedBox(
                          width: 154.0,
                          height: 35.0,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFFEE6983)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ))),
                            child: const Text(
                              'Buy now',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFF5F5F5)),
                            ),
                            onPressed: () {},
                          ),
                        )
                      ])),
            )));
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
