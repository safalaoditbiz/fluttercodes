import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_4/screens/search.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/backscreen.png"),
              fit: BoxFit.cover)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 80),
              child: const Image(
                image: AssetImage(
                  "assets/images/logo.png",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                child: const Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFFFFF)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 24),
              child: Text(
                "You will get a OTP via SMS",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFFFFFFF)),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 553, right: 553),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomOtpField(),
                      const CustomOtpField(),
                      const CustomOtpField(),
                      SizedBox(
                        width: 5,
                      ),
                      const CustomOtpField(),
                      const CustomOtpField(),
                      const CustomOtpField(),
                    ],
                  ),
                )),
            Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 28.0, bottom: 10),
                  child: SizedBox(
                      height: 56,
                      width: 260,
                      child: TextButton(
                          child: const Text(
                            "Verify OTP",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Search()));
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.white,
                          ))),
                )),
            const Text(
              "Resent OTP",
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w400),
            )
          ]),
    ));
  }
}

class CustomOtpField extends StatelessWidget {
  const CustomOtpField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 35,
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          focusColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(5, 5, 5, -12),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        cursorColor: Colors.white,
        textAlign: TextAlign.center,
        enabled: true,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {},
      ),
    );
  }
}
