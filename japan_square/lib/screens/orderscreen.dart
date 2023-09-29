import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:japan_square/screens/cartscreen.dart';
import 'package:japan_square/screens/homescreen.dart';
import 'package:japan_square/screens/profilescreen.dart';

class Orderscreen extends StatefulWidget {
  const Orderscreen({super.key});

  @override
  State<Orderscreen> createState() => _OrderscreenState();
}

class _OrderscreenState extends State<Orderscreen> {
  bool isExpand = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(
                top: 40.0,
                left: 26,
                right: 20,
              ),
              child: Container(
                child: Row(
                  children: [
                    Image(
                      image: AssetImage("assets/images/g72.png"),
                      height: 20,
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Order",
                        style: TextStyle(
                            color: Color(0xff393D40),
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              // decoration: BoxDecoration(
              //     borderRadius:
              //         BorderRadius.only(topLeft: Radius.circular(50))),
              height: 650,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Theme(
                      data: ThemeData(
                          expansionTileTheme: ExpansionTileThemeData().copyWith(
                              backgroundColor: Color(0xff681A1E),
                              textColor: Color(0xffF7F7F7))),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Container(
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                              color:
                                  //  isExpand ? Color(0xff681A1E) :
                                  Color(0xffffffff),
                              elevation: 0.5,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: ExpansionTile(
                                  // textColor: Color(0xffffffff),
                                  // collapsedBackgroundColor: Color(0xffffffff),
                                  // textColor: isExpand
                                  //     ? Color(0xffffffff)
                                  //     : Color(0xff681A1E),
                                  // collapsedBackgroundColor: Color(0xffffffff),
                                  onExpansionChanged: (bool isExapnd) {
                                    setState(() {
                                      isExpand = isExapnd;
                                    });
                                  },
                                  collapsedBackgroundColor: Color(0xffffffff),
                                  collapsedTextColor: Color(0xff636363),

                                  maintainState: true,
                                  initiallyExpanded: false,
                                  backgroundColor: Color(0xff681A1E),
                                  textColor: Color(0xffffffff),
                                  trailing: SizedBox.shrink(
                                      // child: Container(
                                      //   color: isExpand
                                      //       ? Color(0xff681A1E)
                                      //       : Color(0xffffffff),
                                      //   height: 10,
                                      //   width: 10,
                                      // ),
                                      ),
                                  title: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Order ID:",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              Text(
                                                " #554545444",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0),
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(
                                                "assets/images/into.png",
                                                color: Color(0xffffffff),
                                                height: 15,
                                                width: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0, left: 0, top: 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Date: ",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  // color: Color(0xff636363)
                                                ),
                                              ),
                                              Text(
                                                " 12/10/2023",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  //   color: Color(0xff636363)
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 0.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Total: ",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                Text(
                                                  " 12500",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: 12,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder:
                                              (context, index) => Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 12.0),
                                                    child: InkWell(
                                                      splashColor: Colors.blue
                                                          .withAlpha(30),
                                                      onTap: () {
                                                        debugPrint(
                                                            'Card tapped.');
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 6.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                    height: 53,
                                                                    width: 53,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child: Image(
                                                                          image:
                                                                              AssetImage("assets/images/headset.png")),
                                                                    )),
                                                                Container(
                                                                    child: Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .start,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,

                                                                        // ignore: sort_child_properties_last
                                                                        children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(2.0),
                                                                        child:
                                                                            Text(
                                                                          "Fire Bolt Watches",
                                                                          style: const TextStyle(
                                                                              fontWeight: FontWeight.w400,
                                                                              fontSize: 14,
                                                                              color: Color(0xff393D40)),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(2.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              "MRP: 12321",
                                                                              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: Color(0xff681A1E)),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 126.0),
                                                                              child: Text(
                                                                                "S Rate:4500",
                                                                                style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: Color(0xff035811)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(2.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(right: 8.0),
                                                                              child: Text(
                                                                                "Quanty:",
                                                                                style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: Color(0xff393D40)),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 186.0),
                                                                              child: Text(
                                                                                "164",
                                                                                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Color(0xff035811)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ])),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: Divider(
                                                                thickness: 0.25,
                                                                indent: 10,
                                                                endIndent: 10,
                                                                height: 1,
                                                                color: Color(
                                                                    0xff6C6C6C40),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
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
                icon: Image.asset(
                  "assets/images/order.png",
                  color: Color(0xffF7F7F7),
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Profilescreen()));
                },
                icon: Image.asset(
                  "assets/images/profile.png",
                  color: Color(0xffA8A8A8),
                )),
          ],
        ),
      ),
    );
  }
}
