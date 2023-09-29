import 'dart:convert';
import 'dart:core';

import 'dart:developer';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx22/credentiol/login.dart';
import 'package:getx22/widget/productgrid.dart';
import 'package:http/http.dart' as http;

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/productoverviewpage.dart';

class loginController extends GetxController {


  SharedPreferences? logindata;
  bool? newuser;
  @override
  void onInit() {
    // TODO: implement initState

    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata!.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Get.to(ProductOverviewPage());
      //   Navigator.pushReplacement(
      //       context, new MaterialPageRoute(builder: (context) => MyDashboard()));
    }
  }
   

  Future<Map<String, dynamic>> LoginPage(
    String username,
    String password,
  ) async {
    var result;
    print("webservice");

    print(username);
    print(password);

    final Map<String, dynamic> registerData = {
      'username': username,
      'password': password
    };

    print(registerData.toString());
    final Url = "http://192.168.149.211:8080/shopgetx/login.jsp";
    final response = await http.post(Uri.parse(Url), body: registerData
        // headers: {'Content-Type': 'application/json'}
        );
    print(response.statusCode);

    if (response.statusCode == 200) {
      print("inside 200");
      if (response.body.contains("success")) {
        // saveuserdetails(username);
        logindata!.setBool('login', false);
        logindata!.setString('username', username);
        Get.to(() => ProductOverviewPage());
      }
    } else {
      //_loggedInStatus = Status.NotLoggedIn;
      //notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }
}
