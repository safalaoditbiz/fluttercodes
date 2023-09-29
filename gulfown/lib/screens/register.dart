import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_4/screens/otp.dart';
import 'package:flutter_application_4/screens/resetpwd.dart';
import 'package:flutter_application_4/screens/search.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/backscreen.png"),
              fit: BoxFit.cover)),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 70),
          child: Container(
              height: 60,
              width: 200,
              child: Image(image: AssetImage("assets/images/logo.png"))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 56,
            width: 260,
            child: TextFormField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: "First name",
                labelStyle: TextStyle(color: Colors.white),
                suffixIcon: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/iden.png",
                  ),
                ),

                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                //fillColor: Colors.green
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 56,
            width: 260,
            child: TextFormField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: "Last name",
                labelStyle: TextStyle(color: Colors.white),
                suffixIcon: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/iden.png",
                  ),
                ),

                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                //fillColor: Colors.green
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 56,
            width: 260,
            child: TextFormField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.white),
                suffixIcon: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/mail.png",
                  ),
                ),

                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                //fillColor: Colors.green
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 56,
            width: 260,
            child: TextFormField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.white),
                suffixIcon: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/lock.png",
                  ),
                ),

                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                //fillColor: Colors.green
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 56,
            width: 260,
            child: TextFormField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                labelStyle: TextStyle(color: Colors.white),
                suffixIcon: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/lock.png",
                  ),
                ),

                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                //fillColor: Colors.green
              ),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 48.0),
            child: SizedBox(
                height: 56,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF373737)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Rsetpwd()));
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.white,
                    )))),
      ]),
    ));
  }
}
