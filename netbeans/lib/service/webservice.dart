import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netbeans/model/login.dart';
import 'package:netbeans/model/login.dart';
import 'package:netbeans/model/registration.dart';
import 'package:netbeans/pages/register.dart';

class Webservice {
  Future<Map<String, dynamic>> login(String username, String password) async {
    print("webservice");
    print("username");
    var result;
    final Map<String, dynamic> loginData = {
      'username': username,
      'password': password,
    };

    final url = "http://192.168.1.75:8080/WebApplication1/login.jsp";
    final response = await http.post(
      Uri.parse(
        url,
      ),
      /* body: jsonEncode(loginData),
        headers: {'Content-Type': 'application/json'}
 */
      body: loginData,
      //headers: {'Content-Type': 'application/json'}
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      var userData = responseData;

      print(userData);

      Login authUser = Login.fromJson(userData);
      result = {'status': true, 'msg': 'Successful', 'user': authUser};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> register(
    String name,
    String place,
    String username,
    String password,
    String gender,
  ) async {
    var result;
    print("webservice");
    print(name);
    print(place);
    print(username);
    print(password);
    print(gender);

    final Map<String, dynamic> registerData = {
      'name': name,
      'place': place,
      'username': username,
      'password': password,
      'gender': gender
    };

    print(registerData.toString());
    final Url = "http://192.168.1.75:8080/WebApplication1/registration.jsp";
    final response = await http.post(Uri.parse(Url), body: registerData
        // headers: {'Content-Type': 'application/json'}
        );
    print(response.statusCode);

    if (response.statusCode == 200) {
      print("inside 200");

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      print("userData :" + userData.toString());
      registration authUser = registration.fromJson(userData);
      result = {'status': true, 'message': 'Successful', 'user': authUser};
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
