import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlite/model.dart';

import 'database_handler.dart';
import 'main.dart';

class modelu extends StatefulWidget {
  @override
  modeluState createState() {
    return modeluState();
  }
}
// drift
// object box

class modeluState extends State<modelu> {
  late DatabaseHandler handler;

  get age => null;
  void initState() {
    super.initState();
    this.handler = DatabaseHandler();
    this.handler.initializeDB().whenComplete(() async {
      // await this.addUsers();
      setState(() {});
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool value = false;
  int val = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(padding: EdgeInsets.all(5)),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your name',
                    labelText: 'Name',
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                TextFormField(
                  controller: countryController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your country',
                    labelText: 'country',
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                TextFormField(
                  controller: ageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Age',
                    labelText: 'Age',
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    top: 10.0,
                  ),
                  alignment: Alignment.center,
                  // ignore: unnecessary_new
                  child: new ElevatedButton(
                      child: const Text('save'),
                      onPressed: () {
                        int age = int.parse(ageController.text);
                        User user = User(
                            name: nameController.text,
                            age: age,
                            country: countryController.text);
                        handler.insertUser(user);

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MyHomePage(title: 'aaaa')));
                        // ignore: void_checks
                      }),
                )
              ],
            )));
  }
}
