import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:educationapp/model/login2.dart';
import 'package:educationapp/pages/login.dart';

class Webservice {
  Future<Map<String, dynamic>> login(String phonenumber, String otp) async {
    print("webservice");
    print("phonenumber");
    var result;
    final Map<String, dynamic> loginData = {
      'phonenumber': phonenumber,
      'otp': otp,
    };

    final url = "http://192.168.43.79:8080/educationapp/login2.jsp";
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

      login2 authUser = login2.fromJson(userData);
      result = {'status': true, 'msg': 'Successful', 'user': authUser};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }
}
