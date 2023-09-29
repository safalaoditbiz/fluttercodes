import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx22/screens/productoverviewpage.dart';
import 'package:getx22/credentiol/login.dart';
import 'package:getx22/screens/wishscreen.dart';

import '../screens/orderscreen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: Color.fromARGB(255, 245, 121, 162),
            title: Text(
              "",
            ),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.shop,
              color: Color.fromARGB(255, 245, 121, 162),
            ),
            title: Text(
              "Shop",
              style: TextStyle(
                  color: Color.fromARGB(255, 14, 14, 14),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
            ),
            onTap: () {
              Get.to(() => ProductOverviewPage());
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.delivery_dining_rounded,
              color: Color.fromARGB(255, 245, 121, 162),
            ),
            title: Text(
              "Orders",
              style: TextStyle(
                  color: Color.fromARGB(255, 14, 14, 14),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
            ),
            onTap: () {
              Get.to(() => Orderscreen());
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.login,
              color: Color.fromARGB(255, 245, 121, 162),
            ),
            title: Text(
              "Signin",
              style: TextStyle(
                  color: Color.fromARGB(255, 14, 14, 14),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
            ),
            onTap: () {
              Get.to(() => LoginPage());
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Color.fromARGB(255, 245, 121, 162),
            ),
            title: Text(
              "Favorites",
              style: TextStyle(
                  color: Color.fromARGB(255, 14, 14, 14),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
            ),
            onTap: () {
              Get.to(() => wishScreen());
            },
          ),
        ],
      ),
    );
  }
}
