import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:philsa/screens/login1.dart';
import 'package:philsa/screens/otp_screen.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({Key? key}) : super(key: key);

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  TextEditingController _textEditingController = TextEditingController();
  bool _isHintTextVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 110, bottom: 60, left: 57, right: 56),
          child: Container(
            height: 132,
            width: 200,
            child: Image.asset("assets/images/philsa.png", fit: BoxFit.contain),
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
              border: Border.all(color: Color(0xff7D7D7D40), width: 0.5)),
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
                padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16),
                child: VerticalDivider(
                  color: Colors.black,
                  thickness: 0.5,
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
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 240, bottom: 5, top: 20),
          child: Text(
            "Vehicle Number",
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
              border: Border.all(color: Color(0xff7D7D7D40), width: 0.5)),
          child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 25, bottom: 7),
              child: TextField(
                controller: _textEditingController,
                onTap: () {
                  setState(() {
                    _isHintTextVisible = false;
                  });
                },
                style: TextStyle(
                    color: Color(0xff111C22),
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
                showCursor: true,
                cursorColor: Colors.black,
                cursorWidth: 0.5,
                autocorrect: false,
                decoration: InputDecoration(
                    hintText: _isHintTextVisible ? ' ' : '',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        color: Color(0xff111C22),
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              )),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Loginscreen(),
                ));
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 12, right: 20, left: 180),
            child: Text(
              "Already have an account? ",
              style: TextStyle(
                  color: Color(0xff16C2F4),
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 110),
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
                      builder: (context) => OTPscreen(),
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
      ]),
    ));
  }
}
