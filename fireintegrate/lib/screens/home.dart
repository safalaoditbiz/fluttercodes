import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final databaseRef = FirebaseDatabase.instance;
  Map<String, dynamic> data = {};

  String _firstname = '';
  String _secondname = '';
  String _email = '';
  String _username = '';

  var updatedata;
  var updateemail;

  var updatename;

  var updateusername;
  var snapshot = FirebaseFirestore.instance
      .collection('chat')
      .orderBy('createdAt', descending: true)
      .snapshots();
  // final TextEditingController _firstController = TextEditingController();
  // final TextEditingController _secondController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _usernameController = TextEditingController();

  Stream<DocumentSnapshot<Map<String, dynamic>>> _profile() {
    final User user = FirebaseAuth.instance.currentUser!;
    // final FirebaseFirestore firestore = FirebaseFirestore.instance;
    // final DocumentReference documentReference =
    //     firestore.collection('users').doc();
    // final Map<String, dynamic> data = {
    //   'name': updatename,
    //   'email': updateemail,
    //   'username': updateusername,

    // };
    // Future<void> update() async {
    //   final DocumentSnapshot snapshot =
    //       await firestore.collection('users').doc('User UID').get();
    //   _firstname = updatename;
    //   _email = updateemail;
    //   _username = updateusername;

    //   if (snapshot.exists) {
    //     final Object? data = snapshot.data();
    //   } else {
    //     print('Document does not exist');
    //   }
    // }

    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .snapshots();
  }

  @override
  void initState() {
    super.initState();
    _profile();
  }

  @override
  showAlertDialog(BuildContext context, String data, String heading, int index,
      String buttonAcceptTitle, String buttonCancelTitle) {
    Widget cancelButton = ElevatedButton(
      child: Text(buttonCancelTitle),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Homepage(),
        ));
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(heading),
      content: TextFormField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            labelText: data,
            labelStyle: TextStyle(color: Colors.black),
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.black),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          initialValue: updatedata,
          onChanged: (value) {
            setState(() {
              updatedata = value;
              log("uodareeeeeeeee" + updatedata.toString());
            });
          }),
      actions: [
        cancelButton,
        ElevatedButton(
            child: Text(buttonAcceptTitle),
            onPressed: () {
              setState(
                () {
                  setState(() {
                    if (index == 0) {
                      updatename = updatedata;
                      log("uodareeeeeeeee================" +
                          updatename.toString());
                    } else if (index == 1) {
                      updateemail = updatedata;
                    } else if (index == 2) {
                      updateusername = updatedata;
                    }

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Homepage(),
                    ));
                  });
                },
              );
            })
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    ).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    // _firstname = updatename == null ? _firstController.text : updatename;
    // _email = updateemail == null ? _emailController.text : updateemail;
    // _username =
    //     updateusername == null ? _usernameController.text : updateusername;
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: StreamBuilder(
            stream: _profile(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //   log("DATAS ===> ${snapshot.data?.data()?["username"]}");
                log(snapshot.data!.data().toString());
                _firstname = snapshot.data?.data()?["first name"]  +
                    snapshot.data?.data()?["second name"] ;
                _email = snapshot.data?.data()?["email"];
                _username = snapshot.data?.data()?["username"];

                _firstname =
                    updatename == null ? _firstname.toString() : updatename;

                _email = updateemail == null ? _email.toString() : updateemail;

                _username = updateusername == null
                    ? _username.toString()
                    : updateusername;

                log("updateemail" + updateemail.toString());
                log("updatename" + updatename.toString());
                log("updateusername" + updateusername.toString());
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 38.0),
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 40,
                            ),
                            color: Colors.white,
                            child: const Image(
                              image: AssetImage("assets/images/profile.png"),
                              height: 200,
                              width: 200,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Container(
                          height: 224,
                          width: 320,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 6, 168, 174),
                              borderRadius: BorderRadius.circular(18)),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Color.fromARGB(255, 206, 202, 203),
                                      size: 18,
                                    ),
                                    Text(
                                      _firstname,
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 206, 202, 203),
                                          fontSize: 18),
                                    ),
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(left: 4.0),
                                    //   child: Text(
                                    //     snapshot.data
                                    //         ?.data()?["second name"],
                                    //     style: TextStyle(
                                    //         color: Color.fromARGB(
                                    //             255, 206, 202, 203),
                                    //         fontSize: 18),
                                    //   ),
                                    // ),

                                    IconButton(
                                      icon: Icon(
                                        Icons.mode_edit_outline_outlined,
                                        color:
                                            Color.fromARGB(255, 206, 202, 203),
                                        size: 18,
                                      ),
                                      onPressed: () {
                                        updatedata = snapshot.data
                                                ?.data()?["first name"] +
                                            snapshot.data
                                                ?.data()?["second name"];
                                        showAlertDialog(
                                            context,
                                            _secondname,
                                            "Do you want to edit name ",
                                            0,
                                            "ok",
                                            "cancel");
                                      },
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.mail,
                                      color: Color.fromARGB(255, 206, 202, 203),
                                      size: 18,
                                    ),
                                    Text(_email,
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 206, 202, 203),
                                            fontSize: 16)),
                                    IconButton(
                                      icon: Icon(
                                        Icons.mode_edit_outline_outlined,
                                        color:
                                            Color.fromARGB(255, 206, 202, 203),
                                        size: 18,
                                      ),
                                      onPressed: () {
                                        updatedata =
                                            snapshot.data?.data()?["email"];
                                        showAlertDialog(
                                            context,
                                            _email,
                                            "Do you want to edit email",
                                            1,
                                            "ok",
                                            "cancel");
                                      },
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.person_outline_outlined,
                                        color:
                                            Color.fromARGB(255, 206, 202, 203),
                                        size: 18,
                                      ),
                                      Text(
                                        _username,
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 206, 202, 203),
                                            fontSize: 16),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.mode_edit_outline_outlined,
                                          color: Color.fromARGB(
                                              255, 206, 202, 203),
                                          size: 18,
                                        ),
                                        onPressed: () {
                                          updatedata = snapshot.data
                                              ?.data()?["username"];
                                          showAlertDialog(
                                              context,
                                              _username,
                                              "Do you want to edit username ",
                                              2,
                                              "ok",
                                              "cancel");
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // Text(_email),
                              // Text(_username),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox.shrink();
            }),
      ),
    );
  }
}
