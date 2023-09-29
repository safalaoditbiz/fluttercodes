import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx22/controller/wishcontroller.dart';
import 'package:getx22/controller/ordercontroller.dart';
import 'package:getx22/model/wishitem.dart';

import '../controller/cartcontroller.dart';
import '../controller/productcontroller.dart';

class wishScreen extends StatefulWidget {
  final controller = Get.put(ProductController());

  @override
  State<wishScreen> createState() => _wishScreenState();
}

class _wishScreenState extends State<wishScreen> {
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    var wishController = Get.put(WishController());

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 253, 141, 178),
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Your favorites",
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
                  wishController.clear();
                },
              )
            ]),
        body: ListView.builder(
          itemCount: wishController.items.length,
          itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                  height: 136,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(
                    //   color: Colors.black12,
                    //   width: 2,
                    // ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                 
                  child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        debugPrint('Card tapped.');
                      },
                      child: Row(children: [
                        Container(
                            height: 80,
                            width: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                // "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
                                "http://192.168.149.211:8080/shopgetx/images/" +
                                    wishController.items.values
                                        .toList()[index]
                                        .image,

                                // width: 120,
                              ),
                            )),
                        Container(
                            width: 246,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    // ignore: sort_child_properties_last
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            wishController.items.values
                                                .toList()[index]
                                                .productTitle,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18)),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete,
                                            color: Colors.black, size: 24),
                                        onPressed: () {
                                          log("cancel");
                                         
                                          wishController.removeitem(
                                              wishController.items.values
                                                  .toList()[index]
                                                  .id);
                                        },
                                      )
                                    ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        wishController.items.values
                                            .toList()[index]
                                            .productPrice
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18,
                                            color: Colors.pinkAccent)),
                                  ),
                                  new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "add to cart",
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                        IconButton(
                                            icon: Icon(Icons.shopping_cart),
                                            onPressed: () {
                                              cartController.addItem(
                                                wishController.items.values
                                                    .toList()[index]
                                                    .id,
                                                wishController.items.values
                                                    .toList()[index]
                                                    .productPrice,
                                                wishController.items.values
                                                    .toList()[index]
                                                    .productTitle,
                                                1,
                                                wishController.items.values
                                                    .toList()[index]
                                                    .image,
                                              );
                                              wishController.removeitem(
                                                  wishController.items.values
                                                      .toList()[index]
                                                      .id);
                                             
                                            })
                                      ]),
                                ]))
                      ])))),
        ));
  }
}
