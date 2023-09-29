import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_4/screens/splashscreen.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 235, bottom: 12, top: 20),
          child: Container(
            child: Text(
              "Payment method",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff373737)),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          height: 58,
          width: 328,
          decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(12)),
          child: Theme(
            data: ThemeData(
                toggleableActiveColor: Colors.red,
                unselectedWidgetColor: Colors.grey),
            child: RadioListTile<String>(
              controlAffinity: ListTileControlAffinity.trailing,
              title: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(
                      "assets/images/cash1.png",
                    ),
                  ),
                  const Text(
                    'Online Delivery',
                    style: TextStyle(
                        color: Color(0xff636363),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              value: "Hey",
              groupValue: "newGroup",
              onChanged: (value) {
                print(value);
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          height: 58,
          width: 328,
          decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(12)),
          child: RadioListTile<String>(
            // ListTileControlAffinity.trailing will place the radio at the trailing
            controlAffinity: ListTileControlAffinity.trailing,
            title: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    "assets/images/cash2.png",
                  ),
                ),
                const Text(
                  'Cash on Delivery',
                  style: TextStyle(
                      color: Color(0xff636363),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            value: "Hey",
            groupValue: "newGroup",
            onChanged: (value) {
              print(value);
            },
          ),
        ),
      ])),
      bottomSheet: Container(
          height: 84,
          width: 360,
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          width: 140,
                          child: Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff373737),
                            ),
                          ),
                        ),
                        Container(
                          width: 140,
                          child: Row(
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                size: 18,
                                color: Color(0xff272727),
                              ),
                              Text(
                                "12,0000",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff272727),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 173.0,
                  height: 35.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFEE6983)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ))),
                    child: const Text(
                      'Place Order',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFF5F5F5)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Splashscreen3()));
                    },
                  ),
                )
              ])),
    );
  }
}
