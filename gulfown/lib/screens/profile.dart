import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_4/screens/homescreen.dart';
import 'package:flutter_application_4/screens/search.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Container(
                margin: new EdgeInsets.symmetric(horizontal: 6.0, vertical: 20),
                height: 120,
                width: 328,
                decoration: BoxDecoration(
                    color: Color(0xffEE6983),
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 35,
                                  width: 25,
                                  child: Image.asset(
                                    "assets/images/logo1.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 35,
                                  width: 25,
                                  child: Image.asset(
                                    "assets/images/out.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "Hrishilal.T",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "8157057583",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        Text(
                          "hrishilalt@gmail.com",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    border: Border.all(
                      color: Color(0xff37373766),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 58,
                  width: 328,
                  child: TextButton.icon(
                    style: ButtonStyle(
                      alignment: Alignment.centerLeft,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    icon: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Image.asset(
                        "assets/images/user.png",
                        color: Color(0XFFEE6983),
                      ),
                    ),
                    label: Text(
                      'Edit Profile',
                      style: TextStyle(
                          color: Color(0xffb636363),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    border: Border.all(
                      color: Color(0xff37373766),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 58,
                  width: 328,
                  child: TextButton.icon(
                    style: ButtonStyle(
                      alignment: Alignment.centerLeft,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    icon: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Image.asset(
                        "assets/images/wish.png",
                        color: Color(0XFFEE6983),
                      ),
                    ),
                    label: Text(
                      'Wish List',
                      style: TextStyle(
                          color: Color(0xffb636363),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    border: Border.all(
                      color: Color(0xff37373766),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 58,
                  width: 328,
                  child: TextButton.icon(
                    style: ButtonStyle(
                      alignment: Alignment.centerLeft,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    icon: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Image.asset(
                        "assets/images/computer.png",
                        color: Color(0XFFEE6983),
                      ),
                    ),
                    label: Text(
                      'Preference',
                      style: TextStyle(
                          color: Color(0xffb636363),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    border: Border.all(
                      color: Color(0xff37373766),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 58,
                  width: 328,
                  child: TextButton.icon(
                    style: ButtonStyle(
                      alignment: Alignment.centerLeft,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    icon: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Image.asset(
                        "assets/images/help.png",
                        color: Color(0XFFEE6983),
                      ),
                    ),
                    label: Text(
                      'Help Center',
                      style: TextStyle(
                          color: Color(0xffb636363),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    border: Border.all(
                      color: Color(0xff37373766),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 58,
                  width: 328,
                  child: TextButton.icon(
                    style: ButtonStyle(
                      alignment: Alignment.centerLeft,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    icon: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Image.asset(
                        "assets/images/eye.png",
                        color: Color(0XFFEE6983),
                      ),
                    ),
                    label: Text(
                      'Privacy Policy',
                      style: TextStyle(
                          color: Color(0xffb636363),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    border: Border.all(
                      color: Color(0xff37373766),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 58,
                  width: 328,
                  child: TextButton.icon(
                    style: ButtonStyle(
                      alignment: Alignment.centerLeft,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    icon: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Image.asset(
                        "assets/images/delete.png",
                        color: Color(0XFFEE6983),
                      ),
                    ),
                    label: Text(
                      'Delete Account',
                      style: TextStyle(
                          color: Color(0xffb636363),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              )
            ]),
          ),
        ),
      ),
      bottomSheet: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Homescreen()));
                },
                icon: Image.asset(
                  "assets/images/home2.png",
                  color: Color(0xff373737),
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Search()));
                },
                icon: Image.asset("assets/images/search.png")),
            IconButton(
                onPressed: () {}, icon: Image.asset("assets/images/menu.png")),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
                icon: Image.asset(
                  "assets/images/profile2.png",
                  color: Color(0xffEE6983),
                )),
          ],
        ),
      ),
    );
  }
}
