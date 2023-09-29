import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx22/controller/ordercontroller.dart';
import 'package:getx22/model/cartitem.dart';
import 'package:getx22/model/order.dart';
import 'package:getx22/screens/cartscreen.dart';
import 'package:getx22/screens/productoverviewpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/cartcontroller.dart';
import '../controller/profilecontroller.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'razor_credentials.dart' as razorCredentials;

class payment extends StatefulWidget {
  

  @override
  State<payment> createState() => _paymentState();
}

// enum SingingCharacter { onlinepayment, cashondelivery }

class _paymentState extends State<payment> {
  final _razorpay = Razorpay();

  String? username;
  late SharedPreferences logindata;
  // @override

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

  String? _character = "online payment";
  Order? check;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print(response);
    verifySignature(
      signature: response.signature,
      paymentId: response.paymentId,
      orderId: response.orderId,
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(response);
    // Do something when payment fails
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.message ?? ''),
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print(response);
    // Do something when an external wallet is selected
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.walletName ?? ''),
      ),
    );
  }

// create order
  void createOrder() async {
    String username = razorCredentials.keyId;
    String password = razorCredentials.keySecret;
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    Map<String, dynamic> body = {
      "amount": 100,
      "currency": "INR",
      "receipt": "rcptid_11"
    };
    var res = await http.post(
      Uri.https(
          "api.razorpay.com", "v1/orders"), //https://api.razorpay.com/v1/orders
      headers: <String, String>{
        "Content-Type": "application/json",
        'authorization': basicAuth,
      },
      body: jsonEncode(body),
    );

    if (res.statusCode == 200) {
      openGateway(jsonDecode(res.body)['id']);
    }
    print(res.body);
  }

  openGateway(String orderId) {
    var options = {
      'key': razorCredentials.keyId,
      'amount': 100, //in the smallest currency sub-unit.
      'name': 'Acme Corp.',
      'order_id': orderId, // Generate order_id using Orders API
      'description': 'Fine T-Shirt',
      'timeout': 60 * 5, // in seconds // 5 minutes
      'prefill': {
        'contact': '9123456789',
        'email': 'ary@example.com',
      }
    };
    _razorpay.open(options);
  }

  verifySignature({
    String? signature,
    String? paymentId,
    String? orderId,
  }) async {
    Map<String, dynamic> body = {
      'razorpay_signature': signature,
      'razorpay_payment_id': paymentId,
      'razorpay_order_id': orderId,
    };

    var parts = [];
    body.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    var res = await http.post(
      Uri.https(
        "10.0.2.2", // my ip address , localhost
        "razorpay_signature_verify.php",
      ),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded", // urlencoded
      },
      body: formData,
    );

    print(res.body);
    if (res.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res.body),
        ),
      );
    }
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initial();
    OrderController orderController = Get.put(OrderController());
    var cartController = Get.put(CartController());
    double granttotal = cartController.totalAmount + 40;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 144, 179),
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Payment",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
          )),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            height: 180,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total order:  "
                          '${cartController.totalAmount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                              color: Color.fromARGB(255, 243, 116, 158)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Deliverycharge:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "40",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              color: Color.fromARGB(255, 255, 126, 169)),
                        )
                      ],
                    ),
                  ),
                 
                  Divider(
                    height: 40,
                    thickness: 0,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Grant Total:  " + granttotal.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: Color.fromARGB(255, 251, 130, 170)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      width: 400,
                     
                      child: RadioListTile(
                        selectedTileColor: Colors.white,
                        tileColor: Colors.white,
                        activeColor: Colors.white,
                        title: Row(
                          children: [
                            Text(
                              " Online payment",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 244, 115, 158)),
                            ),
                          ],
                        ),
                        value: "Online payment",
                        groupValue: _character,
                        onChanged: (value) {
                          setState(() {
                            createOrder();
                            _character = value.toString();
                            log("_chaar000000" + _character.toString());
                          });
                        },
                      ),
                    ),
                    Container(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Container(
                              color: Colors.white,
                              width: 400,
                              
                              child: RadioListTile(
                                tileColor: Colors.white,
                                selectedTileColor: Colors.white,
                                activeColor: Colors.white,
                                title: Text(
                                  "Cash On Delivery",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color:
                                          Color.fromARGB(255, 248, 123, 164)),
                                ),
                                value: "Cash On Delivery",
                                groupValue: _character,
                                onChanged: (value) {
                                  setState(() {
                                    _character = value.toString();
                                    log("_chaar111" + _character.toString());
                                  });
                                },
                              ),
                            )
                          ],
                        ))
                  ]),
            ),
          ),
        )
      ]),
      bottomSheet: Container(
        color: Colors.white,
        width: 400,
        height: 90,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 254, 136, 175)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                )),
            child: const Text(
              'Order now',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              //check!.products = cartController.items.values.toList();
              //log(check!.products.toString());
              if (_character == "Cash On Delivery") {
                log("cashondelivery");
                String datetime = DateTime.now().toString();
                print(datetime);

                log("username profile===" + username.toString());
                log("amount" + granttotal.toString());

                log("_charecter" + _character.toString());
                log("product ss");

                // var cartController = Get.put(CartController());
                log("cartController.items.values.toList(),==" +
                    cartController.items.values.toList().length.toString());
                Order neworder = Order(
                    username: username.toString(),
                    amount: granttotal,
                    products: cartController.items.values.toList(),
                    orderdate: DateTime.now().toString());
                orderController.getcheckout(neworder);
                cartController.clear();
                Get.to(() => ProductOverviewPage());
              } else if (_character == "Online payment") {
                log("onlinepayment");
                Get.to(() => ProductOverviewPage());
                cartController.clear();
              }
            },
          ),
        ),
      ),
    ));
  }
}
