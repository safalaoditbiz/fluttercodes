import 'dart:convert';
import 'dart:core';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx22/screens/productoverviewpage.dart';
import 'package:http/http.dart' as http;

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signupcontroller extends GetxController {


  Future<Map<String, dynamic>> SignupPage(
    String name,
    String phone,
    String email,
    String username,
    String password,
    String address,
  ) async {
    var result;
    print("webservice");
    print(name);
    print(phone);
    print(email);
    print(username);
    print(password);
    print(address);

    final Map<String, dynamic> registerData = {
      'name': name,
      'phone': phone,
      'email': email,
      'username': username,
      'password': password,
      'address': address,
    };

    print(registerData.toString());
    final Url = "http://192.168.149.211:8080/shopgetx/register.jsp";
    final response = await http.post(Uri.parse(Url), body: registerData
        // headers: {'Content-Type': 'application/json'}
        );
    print(response.statusCode);

    if (response.statusCode == 200) {
      print("inside 200");
      if (response.body.contains("success")) {
        //saveuserdetails(username);

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
