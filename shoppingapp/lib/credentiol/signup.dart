import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/logincontrolling.dart';
import '../controller/signupcontroller.dart';
import '../screens/productoverviewpage.dart';

class SignupPage extends StatelessWidget {
  final controller = Get.put(Signupcontroller());

  final formKey = GlobalKey<FormState>();
  String? name;
  String? phone;
  String? email;
  String? username;
  String? address;

  String? password;
  @override
  Widget build(BuildContext context) {
    TextEditingController name = new TextEditingController();
    TextEditingController phone = new TextEditingController();
    TextEditingController email = new TextEditingController();
    TextEditingController username = new TextEditingController();
    TextEditingController password = new TextEditingController();
    TextEditingController address = new TextEditingController();
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              key: formKey,
              child: ListView(children: [
                Column(children: <Widget>[
                  Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.w900),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    child: TextFormField(
                      controller: name,
                      autofocus: true,
                      onSaved: (value) =>
                          username = value! as TextEditingController,
                      validator: (value) =>
                          value!.isEmpty ? "Please enter name" : null,
                      decoration: InputDecoration(
                        labelText: ' Name',
                        hintText: 'Enter Your Name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    child: TextFormField(
                      controller: phone,
                      autofocus: true,
                      onSaved: (value) =>
                          username = value! as TextEditingController,
                      validator: (value) =>
                          value!.isEmpty ? "Please enter phone" : null,
                      decoration: InputDecoration(
                        labelText: 'phone',
                        hintText: 'Enter Your phone',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    child: TextFormField(
                      controller: email,
                      autofocus: true,
                      onSaved: (value) =>
                          username = value! as TextEditingController,
                      validator: (value) =>
                          value!.isEmpty ? "Please enter email" : null,
                      decoration: InputDecoration(
                        labelText: 'email',
                        hintText: 'Enter Your email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    child: TextFormField(
                      controller: username,
                      autofocus: true,
                      onSaved: (value) =>
                          username = value! as TextEditingController,
                      validator: (value) =>
                          value!.isEmpty ? "Please enter username" : null,
                      decoration: InputDecoration(
                        labelText: 'User Name',
                        hintText: 'Enter Your Name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    child: TextFormField(
                      controller: password,
                      autofocus: true,
                      onSaved: (value) =>
                          password = value! as TextEditingController,
                      validator: (value) =>
                          value!.isEmpty ? "Please enter password" : null,
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter Password',
                        // enabledBorder: OutlineInputBorder()
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    child: TextFormField(
                      controller: address,
                      autofocus: true,
                      onSaved: (value) =>
                          username = value! as TextEditingController,
                      validator: (value) =>
                          value!.isEmpty ? "Please enter address" : null,
                      decoration: InputDecoration(
                        labelText: 'address',
                        hintText: 'enter address',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(40),
                        //     border: Border(
                        //         bottom: BorderSide(color: Colors.black),
                        //         top: BorderSide(color: Colors.black),
                        //         right: BorderSide(color: Colors.black),
                        //         left: BorderSide(color: Colors.black))),
                        child: MaterialButton(
                          color: Color.fromARGB(255, 248, 139, 175),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            print("name===" + name.text);
                            print("phone===" + phone.text);

                            print("email===" + email.text);
                            print("username===" + username.text);
                            print("password===" + password.text);
                            print("address===" + address.text);
                            //  ProductOverviewPage();

                            controller.SignupPage(
                              name.text,
                              phone.text,
                              email.text,
                              username.text,
                              password.text,
                              address.text,
                            );
                          },
                          // color: Colors.indigoAccent[400],
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(40)),

                          child: Text(
                            "Signup",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                          // onPressed: () {
                          //   // Navigator.pushReplacement(
                          //   //     context,
                          //   //     MaterialPageRoute(
                          //   //         builder: (context) =>
                          //   //             ProductOverviewPage()));
                          // })),
                        )),
                  ),
                ]),
              ]),
            )));
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
              color: Color.fromARGB(255, 156, 133, 133),
            ),
          ),
          border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 127, 107, 107))),
        ),
      ),
      SizedBox(
        height: 30,
      )
    ],
  );
}
