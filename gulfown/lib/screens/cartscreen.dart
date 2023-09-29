import 'package:flutter/material.dart';
import 'package:flutter_application_4/screens/address.dart';
import 'package:flutter_application_4/screens/payment.dart';
import 'package:flutter_application_4/screens/products.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            unselectedLabelColor: Color(0xff373737),
            labelColor: Color(0xffEE6983),
            onTap: (value) {},
            tabs: [
              Tab(
                  icon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Products",
                        style: TextStyle(
                            // color: Color(0xffEE6983),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        // color: Color(0xffEE6983),
                        size: 16,
                      ),
                    ],
                  ),
                ],
              )),
              Tab(
                  icon: Row(
                children: const [
                  Text(
                    "Address",
                    style: TextStyle(
                        // color: Color(0xff373737),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    // color: Color(0xff373737),
                    size: 16,
                  ),
                ],
              )),
              Tab(
                icon: Row(
                  children: const [
                    Text(
                      "Payment",
                      style: TextStyle(
                          // color: Color(0xff373737),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      // color: Color(0xff373737),
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
          title: const Padding(
            padding: EdgeInsets.only(left: 50.0),
            child: Text(
              "Shopping Cart",
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w500),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.0),
            ),
          ),
          elevation: 0,
          backgroundColor: const Color(0xFFFFFFFF),
          leading: Padding(
            padding: const EdgeInsets.all(14.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 4,
                width: 4,
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
          )),
      body: TabBarView(controller: _tabController, children: [
        Products(
          tabController: _tabController,
        ),
        Address(
          tabController: _tabController,
        ),
        Payment()
      ]),
    );
  }
}
