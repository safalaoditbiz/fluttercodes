import 'package:flutter/material.dart';

import 'package:splashscreen/splashscreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:educationapp/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: new secondscreen(),
      image: new Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-oKNc2QYMIerc50dlCU36qvi_8s57Q_7k0Q&usqp=CAU'),
      photoSize: 200.0,
      loaderColor: Colors.blue,
    );
  }
}

class secondscreen extends StatelessWidget {
  final List<String> imagesList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvdZtQJjMLqm5Lg1Ro-GV_Up69G1bemTWq7A&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyziuK9e4R9XP8KOF3Yw72W0HywZ84npAeig&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx-0F1N3_bo5gksTjEC3qAbAnn63YGZid0ag&usqp=CAU',
  ];
  @override
  Widget build(BuildContext context) {
    var getScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
            height: getScreenHeight, autoPlay: true, viewportFraction: 1.0),
        items: imagesList
            .map(
              (item) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(children: <Widget>[
                  Image.network(
                    item,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Column(children: <Widget>[
                    Align(
                        alignment: Alignment.center,
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Text('START'),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => login()));
                          },
                        ))
                  ])
                ]),
              ),
            )
            .toList(),
      ),
    );
  }
}
