// import 'dart:convert';

// import 'package:flutter/services.dart' as rootBundle;

// import 'package:http/http.dart' as http;
// import 'package:cafe_app/model/login.dart';
// import 'package:cafe_app/model/login.dart';
// import 'package:cafe_app/model/registration.dart';
// import 'package:cafe_app/pages/register.dart';
// import 'package:cafe_app/model/datamodel.dart';

// class Webservice {
//   Future<Map<String, dynamic>> login(String username, String password) async {
//     print("webservice");
//     print("username");
//     var result;
//     final Map<String, dynamic> loginData = {
//       'username': username,
//       'password': password,
//     };

//     final url = "http://192.168.127.211:8080/cafe_app/login.jsp";
//     final response = await http.post(
//       Uri.parse(
//         url,
//       ),
//       /* body: jsonEncode(loginData),
//         headers: {'Content-Type': 'application/json'}
//  */
//       body: loginData,
//       //headers: {'Content-Type': 'application/json'}
//     );
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> responseData = jsonDecode(response.body);
//       var userData = responseData;

//       print(userData);

//       Login authUser = Login.fromJson(userData);
//       result = {'status': true, 'msg': 'Successful', 'user': authUser};
//     } else {
//       result = {
//         'status': false,
//         'message': json.decode(response.body)['error']
//       };
//     }
//     return result;
//   }

//   Future<Map<String, dynamic>> register(
//     String email,
//     String username,
//     String password,
//   ) async {
//     var result;
//     print("webservice");
//     print(email);

//     print(username);
//     print(password);

//     final Map<String, dynamic> registerData = {
//       'email': email,
//       'username': username,
//       'password': password,
//     };

//     print(registerData.toString());
//     final Url = "http://192.168.127.211:8080/cafe_app/register.jsp";
//     final response = await http.post(Uri.parse(Url), body: registerData
//         // headers: {'Content-Type': 'application/json'}
//         );
//     print(response.statusCode);

//     if (response.statusCode == 200) {
//       print("inside 200");

//       final Map<String, dynamic> responseData = jsonDecode(response.body);

//       var userData = responseData;

//       print("userData :" + userData.toString());
//       registration authUser = registration.fromJson(userData);
//       result = {'status': true, 'message': 'Successful', 'user': authUser};
//     } else {
//       //_loggedInStatus = Status.NotLoggedIn;
//       //notifyListeners();
//       result = {
//         'status': false,
//         'message': json.decode(response.body)['error']
//       };
//     }
//     return result;
//   }
// }
