import 'package:flutter/material.dart';
import 'package:mobileapp2/screens/welcomescreen.dart';

class Login1 extends StatelessWidget {
  const Login1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 240, left: 20, right: 205),
              child: Text(
                "welcome!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Text(
                "please signin or signup for continue our app",
                style: TextStyle(
                    color: Color.fromARGB(255, 114, 113, 113),
                    fontSize: 19,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 0, right: 265, bottom: 5),
                    child: Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 0.1,
                            spreadRadius: 0.2,
                            offset: Offset(
                              0.5,
                              0.5,
                            ),
                          )
                        ],
                      ),
                      height: 50,
                      width: 320,
                      child: TextField(
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                          cursorColor: Colors.black,
                          cursorWidth: 1,
                          // autofocus: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(14),
                              enabledBorder: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              suffixIcon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 13,
                                    ),
                                  )))))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 0, right: 230, bottom: 5),
                    child: Text(
                      "Password",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 0.1,
                          spreadRadius: 0.2,
                          offset: Offset(
                            0.5,
                            0.5,
                          ),
                        )
                      ],
                    ),
                    height: 50,
                    width: 320,
                    child: TextField(
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                      cursorColor: Colors.black,
                      cursorWidth: 1,
                      // autofocus: true,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(14),
                          enabledBorder: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          disabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 13,
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 40),
                child: GestureDetector(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Welcomescreen(),
                        ));
                  }),
                  child: Container(
                    height: 50,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 136, top: 16),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        // border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(40)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
