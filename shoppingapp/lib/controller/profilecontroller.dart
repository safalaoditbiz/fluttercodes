import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx22/model/product.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:getx22/model/profile.dart';

class ProfileController extends GetxController {
  late String username;
  late SharedPreferences logindata;

  void saveuserdetails(String username) async {
    logindata = await SharedPreferences.getInstance();

    logindata.setString("username", username);

    if (logindata.getString('username') != null) {
      username = logindata.getString('username')!;
      print('username ::::::HOME:::>>>>:::::::' + username);
      print('username ::::::HOME:::>>>>:::::::' + username);
      // getorder(username);

    } else {
      log("loginn go");
    }
  }

  List<dynamic> items = [].obs;
  @override
  // void onInit() {
  //   super.onInit();
  //   fetchProducts();
  // }

  void fetchProfile(String? username) async {
    log("username in profile controller ===" + username.toString());
    var result;

    final Map<String, dynamic> registerData = {
      'username': username,
    };

    final url = "http://192.168.149.211:8080/shopgetx/profile.jsp";
    final response = await http.post(Uri.parse(url), body: registerData

        
        );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("response.statusCode :" + response.statusCode.toString());

      print("request reply :" + response.body);
      var result = jsonDecode(response.body);
      // print(body);
      //   final Iterable json = body;

      items = result.map((data) => new Profileitems.fromJson(data)).toList();
    } else {
      print("Unable to perform request!");
      throw Exception("Unable to perform request!");
    }
  }
}
