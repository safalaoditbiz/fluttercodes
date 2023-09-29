import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:philsa/screens/homescreen.dart';

class OTPscreen2 extends StatefulWidget {
  const OTPscreen2({Key? key}) : super(key: key);

  @override
  State<OTPscreen2> createState() => _OTPscreen2State();
}

class _OTPscreen2State extends State<OTPscreen2> {
  List<String> otpDigits = ['', '', '', ''];
  bool isButtonEnabled = false;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    focusNodes = List<FocusNode>.generate(
      otpDigits.length,
      (index) => FocusNode(),
    );
  }

  @override
  void dispose() {
    focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  void _updateOTP(String value, int index) {
    setState(() {
      otpDigits[index] = value;
      isButtonEnabled = otpDigits.every((String digit) => digit.isNotEmpty);
    });

    if (value.isNotEmpty) {
      if (index < otpDigits.length - 1) {
        focusNodes[index + 1].requestFocus();
      } else {
        focusNodes[index].unfocus();
      }
    } else {
      if (index > 0) {
        focusNodes[index - 1].requestFocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 100, bottom: 50, left: 57, right: 56),
              child: Container(
                height: 132,
                width: 200,
                child: Image.asset("assets/images/philsa.png",
                    fit: BoxFit.contain),
              ),
            ),
            Text("Verify Your Mobile Number"),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              for (int i = 0; i < otpDigits.length; i++)
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    width: 65,
                    height: 57,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xff7D7D7D), width: 0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        // autofocus: true,
                        focusNode: focusNodes[i],
                        onChanged: (value) => _updateOTP(value, i),
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        showCursor: true,
                        cursorColor: Colors.black,
                        cursorWidth: 0.5,
                        autocorrect: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          counterText: '',
                        ),
                      ),
                    ),
                  ),
                ),
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isButtonEnabled
                      ? Container()
                      : Row(
                          children: [
                            Image(image: AssetImage("assets/images/time.png")),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                "20 Sec",
                                style: TextStyle(
                                  color: Color(0xff16C2F4),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            )
                          ],
                        ),
                  Text(
                    "Resend OTP?",
                    style: TextStyle(
                      color: Color(0xff7D7D7D),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 175),
              child: Container(
                height: 53,
                width: 320,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color(0xff7D7D7D),
                        width: isButtonEnabled ? 0 : 0.1),
                    borderRadius: BorderRadius.circular(8)),
                child: TextButton(
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  onPressed: isButtonEnabled
                      ? () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homescreen()));
                        }
                      : null,
                  style: TextButton.styleFrom(
                    foregroundColor:
                        isButtonEnabled ? Color(0xffffffff) : Color(0xff7D7D7D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color: isButtonEnabled
                              ? Color(0xff16C2F4)
                              : Color(0xff7D7D7D),
                          width: isButtonEnabled ? 0 : 0.1),
                    ),
                    backgroundColor:
                        isButtonEnabled ? Color(0xff16C2F4) : Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
