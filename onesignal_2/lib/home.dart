import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    configureOneSignal();
  }

  void configureOneSignal() async {
    await OneSignal.shared.setAppId('bb505766-4115-457c-ad45-82375ffb620b');

    if (Platform.isIOS) {
      OneSignal.shared.setNotificationOpenedHandler(
          (OSNotificationOpenedResult notification) {
        // Handle notification opening
      });
    } else {
      OneSignal.shared.setNotificationOpenedHandler(
          (OSNotificationOpenedResult openedResult) {
        // Handle notification opening
      });

      OneSignal.shared.setNotificationWillShowInForegroundHandler(
          (OSNotificationReceivedEvent event) {
        event.complete(event.notification);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 232, 110, 65),
                    borderRadius: BorderRadius.circular(25)),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 232, 110, 65),
                    borderRadius: BorderRadius.circular(50)),
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 232, 110, 65),
                    borderRadius: BorderRadius.circular(100)),
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 232, 110, 65),
                    borderRadius: BorderRadius.circular(200)),
                child: Center(
                  child: const Text(
                    'One Signal',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 232, 110, 65),
                    borderRadius: BorderRadius.circular(100)),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 232, 110, 65),
                    borderRadius: BorderRadius.circular(50)),
              ),
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 232, 110, 65),
                    borderRadius: BorderRadius.circular(25)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
