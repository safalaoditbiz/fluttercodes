import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:getx22/screens/productoverviewpage.dart';

import 'credentiol/login.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.deepOrange,
        fontFamily: "bols",
      ),
      home: LoginPage(),
      //home: ProductOverviewPage(),
    );
  }
}
