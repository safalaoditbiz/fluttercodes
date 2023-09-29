import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final TabController tabController;
  const Products({required this.tabController, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 250, bottom: 12, top: 20),
          child: Text(
            "Product List",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff2F2F2F)),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          height: 87,
          width: 328,
          decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(18)),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Row(children: [
                  Image(
                    image: AssetImage("assets/images/phone.png"),
                    height: 67,
                    width: 71,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 125,
                        child: Text(
                          "Fire- Bolt Legacy | 12.35 Amoled | Bluetooth Calli....",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff636363)),
                        ),
                      ),
                      Text(
                        "In Stock",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1FAF38),
                        ),
                      ),
                      Container(
                          height: 20,
                          width: 170,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 0.0),
                                height: 17,
                                width: 161,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.currency_rupee,
                                      size: 14,
                                      color: Color(0xffEE6983),
                                    ),
                                    Text(
                                      "3,999",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffEE6983),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8),
                                      child: Text(
                                        "12,000",
                                        style: new TextStyle(
                                          color: Color(0xff636363),
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "82% off",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xffEE6983),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55),
                    child: Container(
                      height: 70,
                      width: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.add_circle_outline,
                            size: 20,
                            color: Color(0xff636363),
                          ),
                          Text(
                            "1",
                            style: TextStyle(
                                color: Color(0xff636363),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.remove_circle_outline,
                            size: 20,
                            color: Color(0xff636363),
                          ),
                        ],
                      ),
                    ),
                  )
                ]);
              }),
        )
      ])),
      bottomSheet: Container(
          height: 84,
          width: 360,
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          width: 140,
                          child: Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff373737),
                            ),
                          ),
                        ),
                        Container(
                          width: 140,
                          child: Row(
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                size: 18,
                                color: Color(0xff272727),
                              ),
                              Text(
                                "3,999",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff272727),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 173.0,
                  height: 35.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFEE6983)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ))),
                    child: const Text(
                      'Place Order',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFF5F5F5)),
                    ),
                    onPressed: () {
                      tabController.animateTo(1);
                    },
                  ),
                )
              ])),
    );
  }
}
