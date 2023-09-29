import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:philsa/screens/paymentscreen.dart';
import 'package:sizer/sizer.dart';

class Confirmationscreen extends StatelessWidget {
  const Confirmationscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('1h ===> ${1.h}');
    log('1w ===> ${1.w}');
    log('1sp ===> ${1.sp}');
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
                Text(
                  "Confirmation",
                  style: TextStyle(
                      color: Color(0xff111C22),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                )
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
            height: 7.h,
            width: 320,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xff7D7D7D40), width: 0.25)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 7),
              child: Text('KL 53 AE 1406 ',
                  style: TextStyle(
                      color: Color(0xff111C22),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 240, bottom: 5, top: 20),
            child: Text(
              "Date Of Parking",
              style: TextStyle(
                color: Color(0xff7D7D7D),
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Container(
            height: 7.h,
            width: 320,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xff7D7D7D40), width: 0.25)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 7),
              child: Padding(
                padding: const EdgeInsets.only(left: 0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('12/10/2023',
                        style: TextStyle(
                            color: Color(0xff111C22),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400)),
                    Image(
                        image: AssetImage(
                      "assets/images/wallet.png",
                    )),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 239, bottom: 5, top: 20),
            child: Text(
              "Time Of Parking",
              style: TextStyle(
                color: Color(0xff7D7D7D),
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Container(
            height: 7.h,
            width: 320,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xff7D7D7D40), width: 0.25)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 7),
              child: Padding(
                padding: const EdgeInsets.only(left: 0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('10:25 PM ',
                        style: TextStyle(
                            color: Color(0xff111C22),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400)),
                    Image(
                        image: AssetImage(
                      "assets/images/time2.png",
                    )),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 240, bottom: 5, top: 20),
            child: Text(
              "Expected Hour",
              style: TextStyle(
                color: Color(0xff7D7D7D),
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Container(
            height: 7.h,
            width: 320,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xff7D7D7D40), width: 0.25)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 7),
              child: Padding(
                padding: const EdgeInsets.only(left: 0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('1 Hour',
                        style: TextStyle(
                            color: Color(0xff111C22),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400)),
                    Image(
                        image: AssetImage(
                      "assets/images/time2.png",
                    )),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 240, bottom: 5, top: 20),
            child: Text(
              "Parking Amount",
              style: TextStyle(
                color: Color(0xff7D7D7D),
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Container(
            height: 7.h,
            width: 320,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xff7D7D7D40), width: 0.25)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 12, bottom: 7),
              child: Text('50',
                  style: TextStyle(
                      color: Color(0xff111C22),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              height: 7.h,
              width: 320,
              child: TextButton(
                child: Text(
                  "PAY",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Paymentscreen(),
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
    ));
  }
}
