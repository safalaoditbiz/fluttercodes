import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx22/model/cartitem.dart';
import 'package:getx22/model/order.dart';
import 'package:getx22/screens/productoverviewpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  var _orders = [].obs;
  late String username;

  late SharedPreferences logindata;
  var isDataLoading = false.obs;

  static var items;
  //List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  Future<Map<String, dynamic>> getcheckout(Order check) async {
    print("checkout==" + check.toJson().toString());
    var result;
    logindata = await SharedPreferences.getInstance();
    log("userrrrr===" + logindata.getString('username').toString());

    String Url = "http://192.168.149.211:8080/shopgetx/order.jsp";
    //  String jsonData = jsonEncode(check);
    var body = jsonEncode({
      'username': logindata.getString('username'),
      'products': [],
      'amount': 1500.0,
      'dateTime': '2022-09-22 13:21:04.726363'
    });
    body = jsonEncode(check);
    final Map<String, dynamic> checkData = {
      'order': body

      ///  'shopid': shopid,
    };
    // print("qqqqqqqqqqqqqqqqqqqq");
    final response = await http.post(
      Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      // final Map<String, dynamic> responseData = json.decode(response.body);
      print("Msg rsponse==" + response.body);

      if (response.body.contains("success")) {
        Get.to(() => ProductOverviewPage());
      }
    }
    return result;
  }
}
