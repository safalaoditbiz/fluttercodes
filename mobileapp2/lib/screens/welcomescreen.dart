import 'package:flutter/material.dart';
import 'package:mobileapp2/screens/deatailscreen.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/menu.png"),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(221, 211, 215, 226),
                            borderRadius: BorderRadius.circular(100)),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Image.asset("assets/images/man.png"),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 200),
              child: Text(
                "Welcome,",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 27,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 150),
              child: Text(
                "Our Fashion App",
                style: TextStyle(
                    color: const Color.fromARGB(255, 188, 184, 184),
                    fontSize: 22,
                    fontWeight: FontWeight.w100),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(221, 231, 234, 242),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 10),
                          child: Icon(Icons.search),
                        ),
                        Text(
                          "search...",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/filtter.png",
                    height: 50,
                    width: 50,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Container(
                height: 180,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Detailscreen(),
                                      ));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: Image.asset(
                                    "assets/images/bag.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "50% Off",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  // Add spacing between columns
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'On everything today',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'With code:FSCREATION',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 111, 101, 101),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 25,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, top: 4),
                                        child: Text(
                                          "Get Now",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w100,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 0, right: 225),
              child: Text(
                "New Arrivals",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: 242,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 12,
                          top: 10,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Stack(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: Image.asset(
                                    "assets/images/sho.png",
                                    fit: BoxFit.fill,
                                    height: 135,
                                    width: 170,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, top: 10, left: 140),
                                  child: Image.asset(
                                    "assets/images/love.png",
                                  ),
                                )
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text("The Marc Jacobs"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text(
                                "Axel Arigato",
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 125, 123, 123),
                                    fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.attach_money_sharp,
                                    size: 20,
                                  ),
                                  Text("198.00"),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 70,
            )
          ],
        ),
      ),
      bottomSheet: Container(
        height: 68,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            // border: Border.all(width: 1, color: Colors.black),
            boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 0.01,
                  color: Color.fromARGB(255, 154, 151, 151))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50,
              width: 100,
              child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Welcomescreen()));
                  },
                  icon: Container(
                    height: 30,
                    width: 80,
                    child: Image.asset(
                      "assets/images/home.png",
                      fit: BoxFit.fill,
                    ),
                  )),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Welcomescreen()));
                },
                icon: Image.asset("assets/images/cart.png")),
            IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/notification.png")),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Welcomescreen()));
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
