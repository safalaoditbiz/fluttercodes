import 'package:educationapp/model/login2.dart';
import 'package:flutter/cupertino.dart';

import 'package:educationapp/service/webservice.dart';
import 'package:educationapp/main.dart';
import 'package:educationapp/pages/login.dart';

class CommonListViewModel extends ChangeNotifier {
  Future<Map<String, dynamic>> login2(String phonenumber, String otp) async {
    final result = await Webservice().login(phonenumber, otp);
    print(">>>result $result");
    return result;
  }
}
