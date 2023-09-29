import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:japan_square/screens/homescreen.dart';
import 'package:japan_square/screens/homescreen2.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen({super.key});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  List<String> imgList = [
    "assets/images/headset.png",
    "assets/images/headset.png",
    "assets/images/headset.png",
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, right: 280),
            child: Container(
                // child: Image(
                //   image: AssetImage("assets/images/logo1.png"),
                //   height: 25,
                //   width: 17,
                // ),
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 14,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Homescreen2()));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      "Detailed View",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff393D40)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CarouselSlider(
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
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                imgList.length, (index) => carousalDots(index: index)),
          ),
        ],
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
