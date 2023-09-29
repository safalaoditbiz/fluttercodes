import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx22/model/orderview.dart';
import 'package:getx22/model/product.dart';
import 'package:http/http.dart' as http;
import 'package:getx22/screens/orderscreen.dart';

class OrderviewController extends GetxController {
  List<dynamic> orderitems = [].obs;
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    var result;

    final url = "http://192.168.149.211:8080/shopgetx/orderss.jsp";
    final response = await http.post(
      Uri.parse(
        url,
      ),

    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("response.statusCode :" + response.statusCode.toString());

      log("request reply :" + response.body);
      var result = jsonDecode(response.body);
      // print(body);
      //   final Iterable json = body;

      orderitems = result.map((data) => new Orderview.fromJson(data)).toList();
    } else {
      print("Unable to perform request!");
      throw Exception("Unable to perform request!");
    }
  }

  List<Orderview> get items {
    return [...orderitems];
  }

  

}
