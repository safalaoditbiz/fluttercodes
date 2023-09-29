import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:netbeans4/model/list.dart';

class Webservice {
  Future<List<listview>> getlist() async {
    var result;

    final url = "http://192.168.1.75:8080/WebApplication1/list.jsp";
    final response = await http.post(
      Uri.parse(
        url,
      ),          
      /* body: jsonEncode(loginData),
        headers: {'Content-Type': 'application/json'}
 */
      // body: listdata(name, age),
      //headers: {'Content-Type': 'application/json'}
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("response.statusCode :" + response.statusCode.toString());

      print("request reply :" + response.body);
      final body = jsonDecode(response.body);
      print(body);
      final Iterable json = body;

      return json.map((item) => listview.fromJson(item)).toList();
    } else {
      print("Unable to perform request!");
      throw Exception("Unable to perform request!");
    }
  }
}
