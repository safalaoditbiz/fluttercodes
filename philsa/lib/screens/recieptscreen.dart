import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:philsa/screens/homescreen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Recieptscreen extends StatefulWidget {
  const Recieptscreen({Key? key}) : super(key: key);

  @override
  State<Recieptscreen> createState() => _RecieptscreenState();
}

class _RecieptscreenState extends State<Recieptscreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String _qrData = '';

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

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
                    "Receipts",
                    style: TextStyle(
                        color: Color(0xff111C22),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 150,
                width: 150,
                child: Center(child: QrImage(data: _qrData)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 365,
                width: 320,
                decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 0.1,
                      color: Colors.black,
                    )),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 220, top: 20, bottom: 20),
                      child: Image(
                        image: AssetImage("assets/images/philsa.png"),
                        height: 43,
                        width: 99,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Vehicle Number :",
                            style: TextStyle(
                                color: Color(0xff7D7D7D),
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "KL 71 AE 2512",
                            style: TextStyle(
                                color: Color(0xff111C22),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Date of Parking :",
                            style: TextStyle(
                                color: Color(0xff7D7D7D),
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "12/12/2023",
                            style: TextStyle(
                                color: Color(0xff111C22),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Time of parking :",
                            style: TextStyle(
                                color: Color(0xff7D7D7D),
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "10:20 PM",
                            style: TextStyle(
                                color: Color(0xff111C22),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Return Time :",
                            style: TextStyle(
                                color: Color(0xff7D7D7D),
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "02:20 PM",
                            style: TextStyle(
                                color: Color(0xff111C22),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Time :",
                            style: TextStyle(
                                color: Color(0xff7D7D7D),
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "3h 35min",
                            style: TextStyle(
                                color: Color(0xff111C22),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Amount :",
                            style: TextStyle(
                                color: Color(0xff111C22),
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "55",
                            style: TextStyle(
                                color: Color(0xff0EAA00),
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: 150,
                    child: TextButton(
                      child: Text(
                        "Print",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Homescreen(),
                            ));
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Color(0xffFFFFFF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Color(0xff16C2F4)),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 150,
                    child: TextButton(
                      child: Text(
                        "Download",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Homescreen(),
                            ));
                      },
                      style: TextButton.styleFrom(
                          elevation: 1,
                          foregroundColor: Color(0xff111C22),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Color(0xffFFFFFF)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _generateQRCode() {
    final data = _textEditingController.text;
    setState(() {
      _qrData = data;
    });
  }
}
