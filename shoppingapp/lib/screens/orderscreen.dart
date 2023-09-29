import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx22/controller/orderviewcontroller.dart';
import 'package:getx22/model/orderview.dart';
import 'package:getx22/model/product.dart';

class Orderscreen extends StatefulWidget {
  @override
  State<Orderscreen> createState() => _OrdercreenState();
}

class _OrdercreenState extends State<Orderscreen> {
  var orderviewController = Get.put(OrderviewController());
  @override
  Widget build(BuildContext context) {
    //var orderviewController = Get.put(OrderviewController());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 135, 174),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Your orders",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: ListView.builder(
              itemCount: orderviewController.orderitems.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                List<Item> items =
                    orderviewController.orderitems.toList()[index].item;
                log("product length ===" + items.length.toString());

                return Card(
                  child: ExpansionTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Date: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  orderviewController.orderitems
                                      .toList()[index]
                                      .orderdate
                                      .toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.pinkAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Payment: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  orderviewController.orderitems
                                      .toList()[index]
                                      .payment
                                      .toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Total Amount: ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Text(
                                  orderviewController.orderitems
                                      .toList()[index]
                                      .amount
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.pinkAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      children: <Widget>[
                        Container(
                            height: 200,
                            width: 400,
                            child: ListView.builder(
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Container(
                                        height: 120,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1,
                                            )),
                                        child: InkWell(
                                          splashColor:
                                              Colors.blue.withAlpha(30),
                                          onTap: () {
                                            debugPrint('Card tapped.');
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  height: 100,
                                                  width: 100,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Image.network(
                                                      "http://192.168.149.211:8080/shopgetx/images/" +
                                                          items[index].imageUrl,
                                                      // orderviewController
                                                      //     .orderitems
                                                      //     .toList()[index]
                                                      //     .item[index]
                                                      //     .imageUrl
                                                      //     .toString(),
                                                      width: 120,
                                                    ),
                                                  )),
                                              Container(
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,

                                                      // ignore: sort_child_properties_last
                                                      children: [
                                                    Text(
                                                      items[index]
                                                          .productTitle
                                                          .toString(),
                                                      // orderviewController
                                                      //     .orderitems
                                                      //     .toList()[index]
                                                      //     .item[index]
                                                      //     .productTitle
                                                      //     .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: Colors.black),
                                                    ),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                  height: 50,
                                                                  width: 180,
                                                                  child: Text(
                                                                    items[index]
                                                                        .price
                                                                        .toString(),
                                                                    // orderviewController
                                                                    //     .orderitems
                                                                    //     .toList()[
                                                                    //         index]
                                                                    //     .item[
                                                                    //         index]
                                                                    //     .price
                                                                    //     .toString(),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w800,
                                                                        color: Colors
                                                                            .pinkAccent),
                                                                  )),
                                                              Container(
                                                                  height: 50,
                                                                  width: 26,
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        "x",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.w800,
                                                                            color: Colors.grey),
                                                                      ),
                                                                      Text(
                                                                        items[index]
                                                                            .quantity
                                                                            .toString(),
                                                                        // "1",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.w800,
                                                                            color: Colors.grey),
                                                                      ),
                                                                    ],
                                                                  ))
                                                            ],
                                                          ),
                                                        ]),
                                                  ]))
                                            ],
                                          ),
                                        )),
                                  );
                                })),
                      ]),
                );
              })),
    );
  }
}
