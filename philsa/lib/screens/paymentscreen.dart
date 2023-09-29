import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:philsa/screens/recieptscreen.dart';

class Paymentscreen extends StatefulWidget {
  const Paymentscreen({Key? key}) : super(key: key);

  @override
  State<Paymentscreen> createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
  bool _istap1 = true;
  bool _istap2 = true;
  bool _istap3 = true;
  @override
  Widget build(BuildContext context) {
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
                    "Payment",
                    style: TextStyle(
                        color: Color(0xff111C22),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _istap1 = false;
                    _istap2 = true;
                    _istap3 = true;
                  });
                },
                child: Container(
                    height: 52,
                    width: 320,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Color(0xff7D7D7D40), width: 0.25)),
                    child: _istap1
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 12, bottom: 7),
                            child: Text('Cash',
                                style: TextStyle(
                                    color: Color(0xff111C22),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400)),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 12, bottom: 7, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Cash',
                                    style: TextStyle(
                                        color: Color(0xff16C2F4),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                                Image(
                                    image: AssetImage(
                                  "assets/images/tick.png",
                                )),
                              ],
                            ),
                          )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _istap2 = false;
                    _istap1 = true;
                    _istap3 = true;
                  });
                },
                child: Container(
                    height: 52,
                    width: 320,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Color(0xff7D7D7D40), width: 0.25)),
                    child: _istap2
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 12, bottom: 7),
                            child: Text('Google Pay',
                                style: TextStyle(
                                    color: Color(0xff111C22),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400)),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 12, bottom: 7, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Google Pay',
                                    style: TextStyle(
                                        color: Color(0xff16C2F4),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                                Image(
                                    image: AssetImage(
                                  "assets/images/tick.png",
                                )),
                              ],
                            ),
                          )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _istap3 = false;
                    _istap1 = true;
                    _istap2 = true;
                  });
                },
                child: Container(
                    height: 52,
                    width: 320,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Color(0xff7D7D7D40), width: 0.25)),
                    child: _istap3
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 12, bottom: 7),
                            child: Text('Phone Pay',
                                style: TextStyle(
                                    color: Color(0xff111C22),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400)),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 12, bottom: 7, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Phone Pay',
                                    style: TextStyle(
                                        color: Color(0xff16C2F4),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                                Image(
                                    image: AssetImage(
                                  "assets/images/tick.png",
                                )),
                              ],
                            ),
                          )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 220),
              child: Container(
                height: 52,
                width: 320,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Color(0xff7D7D7D40), width: 0.25)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 12, bottom: 7, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Parking Amount",
                          style: TextStyle(
                              color: Color(0xff111C22),
                              fontSize: 18,
                              fontWeight: FontWeight.w400)),
                      Text("50",
                          style: TextStyle(
                              color: Color(0xff0EAA00),
                              fontSize: 18,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                height: 53,
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
                          builder: (context) => Recieptscreen(),
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
