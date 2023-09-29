import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:netbeans/main.dart';
import 'package:netbeans/model/registration.dart';
import 'package:netbeans/service/webservice.dart';
import 'package:netbeans/viewmodel/commonviewmodel.dart';
import 'package:provider/provider.dart';

class register extends StatefulWidget {
  registerstate createState() {
    return registerstate();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class registerstate extends State<register> {
  final formKey = GlobalKey<FormState>();

  var _selectedGender;
  String? name;
  String? password;
  String? username;
  String? place;
  String? gender;

  late CommonListViewModel vm;

  @override
  Widget build(BuildContext context) {
    vm = Provider.of<CommonListViewModel>(context);
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      child: TextFormField(
                          autofocus: true,
                          onSaved: (value) => name = value!,
                          validator: (value) =>
                              value!.isEmpty ? "Please enter name" : null,
                          decoration: InputDecoration(
                              labelText: 'name',
                              hintText: 'NAME',
                              enabledBorder: OutlineInputBorder())),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 12)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                      child: TextFormField(
                          autofocus: true,
                          onSaved: (value) => place = value!,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'pls enter place';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'place',
                              hintText: 'PLACE',
                              enabledBorder: OutlineInputBorder())),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                      child: TextFormField(
                          autofocus: true,
                          onSaved: (value) => username = value!,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'pls enter username';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'username',
                              hintText: 'USERNAME',
                              enabledBorder: OutlineInputBorder())),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: TextFormField(
                          autofocus: true,
                          obscureText: true,
                          onSaved: (value) => password = value!,
                          validator: (value) =>
                              value!.isEmpty ? "Please enter password" : null,
                          decoration: InputDecoration(
                              labelText: 'password',
                              hintText: 'PASSWORD',
                              enabledBorder: OutlineInputBorder())),
                    ),
                    ListTile(
                      leading: Radio(
                        value: 'male',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                            gender = _selectedGender;
                          });
                        },
                      ),
                      title: Text('male'),
                    ),
                    ListTile(
                      leading: Radio(
                        value: 'female',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                            gender = _selectedGender;
                          });
                        },
                      ),
                      title: Text('female'),
                    ),
                    ListTile(
                      leading: Radio(
                        value: 'other',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                            gender = _selectedGender;
                          });
                        },
                      ),
                      title: Text('other'),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 125.0),
                        child: TextButton(
                          child: Text(
                            "_buttonText",
                            style: TextStyle(fontSize: 25),
                          ),
                          onPressed: () {
                            final form = formKey.currentState;
                            if (form!.validate()) {
                              form.save();

                              final Future<Map<String, dynamic>> successfulMessage = vm.register(name!, place!, username!, password!, gender!);
                              //cnfmpassword);

                              log(name!);
                              print(place);

                              print(username);

                              print(password);
                              //print(cnfmpassword);
                              successfulMessage.then((response) {
                                print("response :" + response.toString());
                                if (response['status']) {
                                  print(response);
                                  registration Registration = response['user'];


                                  if(Registration.username==username){

/// navigate to nexrpage
                                  }

                                  //Provider.of<UserProvider>(context, listen: false).setUser(user);

                                }
                                child:
                                const Text('register');
                              });
                            } else {
                              print("form is invalid");
                            }
                          },
                        )),
                  ],
                ))));

    //   final Future<Map<String, dynamic>> successfulMessage=Vm.register(username, password);
    //  print(username);
    //  print(password);
    //  successfulMessage.then((response) {
    //    print("response :" + response.toString());

    //  if (response['status']) {

    //  Navigator.pushReplacement(context,
    //  MaterialPageRoute(
    //  builder: (context) => MyApp())
    //  );
    //  }

    //    }
  }
}
