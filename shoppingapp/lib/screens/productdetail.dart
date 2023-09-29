import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx22/controller/cartcontroller.dart';
import 'package:getx22/controller/productcontroller.dart';
import 'package:getx22/screens/cartscreen.dart';

class ProductDetailsScreen extends StatelessWidget {
  final controller = Get.put(ProductController());

  final cartController = Get.put(CartController());
  int id;
  final String title;
  final double price;
  final String image;
  final String description;

  ProductDetailsScreen(
      this.title, this.price, this.image, this.description, this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 232, 117, 196),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            this.title,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900, fontSize: 22),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                color: Colors.white,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Container(
                      width: 350,
                      height: 400,
                      child: ClipRRect(
                        // borderRadius: BorderRadius.only(
                        //     bottomLeft: Radius.circular(25),
                        //     bottomRight: Radius.circular(25)),
                        child: Image.network(
                          "http://192.168.149.211:8080/shopgetx/images/" +
                              this.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: [
                        Chip(
                          label: Text(
                            "Rs: " + this.price.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.pinkAccent,
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                fontStyle: FontStyle.italic),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "" + this.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 7, 7, 7),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                       
                      ]))
                ]))),
        bottomSheet: Container(
            color: Color.fromARGB(255, 254, 254, 254),
            width: 400,
            height: 90,
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.pinkAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      )),
                  child: const Text('add to cart'),
                  onPressed: () {
                    log(image.toString());
                    cartController.addItem(id, price, title, 1, image);
                  },
                ))));
  }
}
