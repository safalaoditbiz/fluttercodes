import 'package:flutter/cupertino.dart';

import 'package:netbeans/service/webservice.dart';
import 'package:netbeans/main.dart';
import 'package:netbeans/pages/register.dart';

class CommonListViewModel extends ChangeNotifier {
  Future<Map<String, dynamic>> login(String name, String password) async {
    final result = await Webservice().login(name, password);
    print(">>>result $result");
    return result;
  }

  Future<Map<String, dynamic>> register(String name, String place,
      String username, String password, String gender) async {
    final result =
        await Webservice().register(name, place, username, password, gender);
    print(">>>result $result");
    return result;
  }
}
