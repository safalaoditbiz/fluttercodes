import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx22/controller/cartcontroller.dart';
import 'package:getx22/controller/ordercontroller.dart';
import 'package:getx22/controller/profilecontroller.dart';
import 'package:getx22/model/cartitem.dart';
import 'package:getx22/model/order.dart';
import 'package:getx22/model/product.dart';
import 'package:getx22/screens/cartscreen.dart';
import 'package:getx22/screens/payment.dart';
import 'package:getx22/model/profile.dart';
import 'package:getx22/screens/payment2.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class orderplace extends StatefulWidget {
  // @override
  // void initState() {
  //   initial();
  //   super.iniState();
  // }

  @override
  State<orderplace> createState() => _orderplaceState();
}

class _orderplaceState extends State<orderplace> {
  int _itemCount = 0;
  ProfileController controller = Get.put(ProfileController());
  OrderController orderController = Get.put(OrderController());
  CartController Controller = Get.put(CartController());

  String? username;
  late SharedPreferences logindata;
  @override
  void initState() {
    initial();
    //super.iniState();
  }

  Order? check;

  void initial() async {
    logindata = await SharedPreferences.getInstance();

    if (logindata.getString('username') != null) {
      username = logindata.getString('username');
      print('username ::::::HOME:::>>>>:::::::' + username.toString());
      print('username ::::::HOME:::>>>>:::::::' + username.toString());
    } else {
      log("loginn go");
    }
  }

  var name;
  var updateaddress;

  var updatename;
  var phone;
  var address;
  var updatephone;
  var data;
  String? _character = "online payment";

  @override
  showAlertDialog(BuildContext context, String data, String heading, int index,
      String buttonAcceptTitle, String buttonCancelTitle) {
    
    Widget cancelButton = ElevatedButton(
      child: Text(buttonCancelTitle),
      onPressed: () {
        Get.back();
      },
    );
    
    AlertDialog alert = AlertDialog(
      title: Text(heading),
      content: TextFormField(
          initialValue: data,
          onChanged: (value) {
            setState(() {
              data = value;
            });

            
          }),
      actions: [
        cancelButton,
        ElevatedButton(
            child: Text(buttonAcceptTitle),
            onPressed: () {
              setState(
                () {
                  setState(() {
                    if (index == 0) {
                      updatename = data;
                    } else if (index == 1) {
                      updatephone = data;
                    } else if (index == 2) {
                      updateaddress = data;
                    }

                    Get.back();
                  });
                },
              );
            })
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget build(BuildContext context) {
    var orderController = Get.put(OrderController());
    var cartController = Get.put(CartController());
    var granttotal = cartController.totalAmount + 40;
    initial();
    //// initState();
    controller.fetchProfile(username.toString());
    log("username profile===" + username.toString());
   
    var product;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 144, 178),
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Orderplace",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 160,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        name = updatename == null
                            ? controller.items[index].name
                            : updatename;
                        phone = updatephone == null
                            ? controller.items[index].phone
                            : updatephone.toString();
                        //  controller.items[index].phone.toString();
                        address = updateaddress == null
                            ? controller.items[index].address
                            : updateaddress;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    name,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),

                                SizedBox(
                                  width: 10,
                                ),
                                // Text("Safla"),
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  color: Colors.black,
                                  iconSize: 18,
                                  onPressed: () {
                                    log("index ===" + index.toString());
                                    showAlertDialog(context, name, "Do you ", 0,
                                        "ok", "cancel");
                                  },
                                  // child: Text("edit")),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    phone,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),

                                SizedBox(
                                  width: 10,
                                ),
                                //  Text(),
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  color: Colors.black,
                                  iconSize: 18,
                                  onPressed: () {
                                    log("newwww" + phone.toString());
                                    log("index ===" + index.toString());
                                    showAlertDialog(context, phone, "Do you ",
                                        1, "ok", "cancel");
                                  },
                                  // child: Text("edit")),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    address,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),

                                SizedBox(
                                  width: 10,
                                ),
                                //Text("gchagchvzv"),
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  color: Colors.black,
                                  iconSize: 18,
                                  onPressed: () {
                                    showAlertDialog(context, address, "Do you ",
                                        2, "ok", "cancel");
                                  },
                                  //child: Text("edit")),
                                )
                              ],
                            )
                          ],
                        );
                      })),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount: cartController.items.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Color.fromARGB(255, 245, 134, 171),
                                    width: 1,
                                  )),
                              height: 130,
                              child: InkWell(
                                  splashColor: Colors.blue.withAlpha(30),
                                  onTap: () {
                                    debugPrint('Card tapped.');
                                  },
                                  child: Row(children: [
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
                                        width: 220,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Center(
                                                child: Text(
                                                  cartController.items.values
                                                      .toList()[index]
                                                      .productTitle,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 18,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    cartController.items.values
                                                        .toList()[index]
                                                        .productPrice
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: 18,
                                                        color: Colors.pink),
                                                  ),
                                                  Text(
                                                    "x" +
                                                        cartController
                                                            .items.values
                                                            .toList()[index]
                                                            .productQuantity
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: 18,
                                                        color: Colors.black),
                                                  )
                                                ],
                                              ),
                                            ]))
                                  ]))),
                        )),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
          color: Color.fromARGB(255, 254, 254, 254),
          width: 400,
          height: 90,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            // child: SizedBox(
            //   width: 400.0,
            //   height: 50.0,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 242, 134, 170)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    )),
                child: const Text(
                  'Confirm order',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                onPressed: () {
                  Get.to(() => payment());
                }),
          )),
    ));
  }
}
