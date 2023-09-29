import 'package:flutter/material.dart';
import 'package:philsa/screens/login2.dart';

import 'package:philsa/screens/registerscreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 140, bottom: 90, left: 57, right: 56),
              child: Container(
                height: 132,
                width: 200,
                child: Image.asset("assets/images/philsa.png",
                    fit: BoxFit.contain),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 240, bottom: 5),
              child: Text(
                "Mobile Number",
                style: TextStyle(
                  color: Color(0xff7D7D7D),
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Container(
              height: 57,
              width: 320,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xff7D7D7D), width: 0.5)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "+91",
                      style: TextStyle(
                          color: Color(0xff16C2F4),
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 18, bottom: 16, right: 6),
                    child: VerticalDivider(
                      color: Colors.black,
                      thickness: 0.2,
                    ),
                  ),
                  Container(
                      width: 198,
                      height: 29,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                            color: Color(0xff111C22),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        cursorWidth: 0.5,
                        cursorColor: Colors.black,
                        showCursor: true,
                        textInputAction: TextInputAction.next,
                        autocorrect: true,
                        decoration: InputDecoration(

                            //   hintText: '560999988',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                color: Color(0xff111C22),
                                fontSize: 26,
                                fontWeight: FontWeight.w400)),
                      )),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Registerscreen(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 12, right: 20, left: 229),
                child: Container(
                  child: Text(
                    "Create New User? ",
                    style: TextStyle(
                        color: Color(0xff16C2F4),
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Container(
                height: 53,
                width: 320,
                child: TextButton(
                  child: Text(
                    "GET OTP",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPscreen2(),
                        ));
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Color(0xffFFFFFF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Color(0xff16C2F4)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
