import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:getx22/controller/logincontrolling.dart';
import 'package:getx22/credentiol/login.dart';
import 'package:getx22/credentiol/login.dart';

import 'package:getx22/credentiol/signup.dart';

import '../screens/productoverviewpage.dart';
import 'login.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(loginController());

  final formKey = GlobalKey<FormState>();
  String? username;

  String? password;
  @override
  Widget build(BuildContext context) {
    TextEditingController username = new TextEditingController();
    TextEditingController password = new TextEditingController();
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Signin",
          style: TextStyle(
              fontSize: 28, color: Colors.black, fontWeight: FontWeight.w900),
        ),
        Padding(
            padding: EdgeInsets.all(15),
            child: Form(
                key: formKey,
                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                    child: TextFormField(
                      controller: username,
                      autofocus: true,
                      onSaved: (value) =>
                          username = value! as TextEditingController,
                      validator: (value) =>
                          value!.isEmpty ? "Please enter name" : null,
                      decoration: InputDecoration(
                        labelText: 'User Name',
                        hintText: 'Enter Your Name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                    child: TextFormField(
                      controller: password,
                      autofocus: true,
                      onSaved: (value) =>
                          password = value! as TextEditingController,
                      validator: (value) =>
                          value!.isEmpty ? "Please enter password" : null,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter Password',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(40),
                      // border: Border(
                      //     bottom: BorderSide(color: Colors.black),
                      //     top: BorderSide(color: Colors.black),
                      //     right: BorderSide(color: Colors.black),
                      //     left: BorderSide(color: Colors.black))),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          print("username===" + username.text);
                          print("password===" + password.text);
                          ProductOverviewPage();

                          controller.LoginPage(username.text, password.text);
                        },

                        color: Color.fromARGB(255, 249, 134, 172),

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),

                        child: Text(
                          "Signin",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        // onPressed: () {
                        //   Navigator.pushReplacement(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               ProductOverviewPage()));
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                      minWidth: 40,
                      height: 60,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 254, 137, 176),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()));
                      })
                ]))),
      ],
    ));
  }
}

Widget makeInput({label, obsureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obsureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 175, 139, 139),
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 107, 89, 89))),
        ),
      ),
      SizedBox(
        height: 30,
      )
    ],
  );
}
