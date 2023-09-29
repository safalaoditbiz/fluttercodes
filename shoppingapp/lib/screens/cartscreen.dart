
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx22/controller/cartcontroller.dart';
import 'package:getx22/controller/ordercontroller.dart';
import 'package:getx22/controller/productcontroller.dart';
import 'package:getx22/model/product.dart';
import 'package:getx22/screens/orderplace.dart';
import 'package:getx22/widget/cartitem.dart';
import 'package:getx22/screens/orderplace.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _itemCount = 1;

  @override
  Widget build(BuildContext context) {
    var cartController = Get.put(CartController());
    var orderController = Get.put(OrderController());

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 142, 177),
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "Your cart",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 25,
                ),
                onPressed: () {
                  cartController.clear();
                },
              )
            ]),
        body: ListView.builder(
            itemCount: cartController.items.length,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Color.fromARGB(255, 245, 132, 170),
                            width: 1,
                          )),
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          debugPrint('Card tapped.');
                        },
                        child: Row(
                          children: [
                            Container(
                                height: 80,
                                width: 100,
                                // decoration: BoxDecoration(
                                //   //border: Border.all(
                                //   //   width: 1,
                                //   // ),
                                //   borderRadius: BorderRadius.circular(12),
                                // ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    // "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
                                    "http://192.168.149.211:8080/shopgetx/images/" +
                                        cartController.items.values
                                            .toList()[index]
                                            .imageUrl,

                                    // width: 120,
                                  ),
                                )),
                            Container(
                                width: 240,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,

                                    // ignore: sort_child_properties_last
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          cartController.items.values
                                              .toList()[index]
                                              .productTitle,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                     
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                cartController.items.values
                                                    .toList()[index]
                                                    .productPrice
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 18,
                                                    color: Colors.pinkAccent),
                                              ),
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: const Color.fromARGB(
                                                        255, 220, 218, 218)),
                                                height: 40,
                                                width: 120,
                                               
                                                child: new Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: <Widget>[
                                                      cartController
                                                                  .items.values
                                                                  .toList()[
                                                                      index]
                                                                  .productQuantity !=
                                                              1
                                                          ? new IconButton(
                                                              icon: new Icon(
                                                                  Icons.remove),
                                                              onPressed: () {
                                                                log("reduuu --------------------");
                                                                cartController.reducebyone(
                                                                    cartController
                                                                        .items
                                                                        .values
                                                                        .toList()[index]);
                                                              }
                                                             
                                                              )
                                                          : IconButton(
                                                              icon: new Icon(
                                                                  Icons.delete),
                                                              onPressed: () {
                                                                log("reduuu --------------------");
                                                                cartController.removeitem(
                                                                    cartController
                                                                        .items
                                                                        .values
                                                                        .toList()[
                                                                            index]
                                                                        .id);
                                                              }
                                                              
                                                              ),
                                                      new Text(
                                                        cartController
                                                            .items.values
                                                            .toList()[index]
                                                            .productQuantity
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18),
                                                      ),
                                                      new Container(),
                                                      new IconButton(
                                                          icon: const Icon(
                                                              Icons.add),
                                                          onPressed: () {
                                                            log("reduce --------------------");
                                                            cartController.increment(
                                                                cartController
                                                                        .items
                                                                        .values
                                                                        .toList()[
                                                                    index]);
                                                            
                                                          }),
                                                    ]))
                                          ]),
                                    ]))
                          ],
                        ),
                      )),
                )),
        bottomSheet: Container(
            height: 100,
            color: Colors.white,
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total:"
                          '${cartController.totalAmount.toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.normal),
                        ),
                        new SizedBox(
                          width: 240.0,
                          height: 50.0,
                          child: ElevatedButton(
                            style: ButtonStyle(
                             //   backgroundColor: Color.fromARGB(255, 158, 53, 74)  ,
                                                           shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),

                                  //side: BorderSide(color: Colors.red)
                                ))),
                            child: const Text(
                              'Buy now',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => orderplace()));
                            },
                          ),
                        )
                      ])),
            )));
  }
}
  


