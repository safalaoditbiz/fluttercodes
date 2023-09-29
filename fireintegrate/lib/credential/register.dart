import 'dart:developer';

import 'package:fireintegrate/bloc/registerbloc.dart';
import 'package:fireintegrate/bloc/registerevent.dart';
import 'package:fireintegrate/bloc/registerstate.dart';
import 'package:fireintegrate/credential/login.dart';
import 'package:fireintegrate/screens/home.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _secondnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // void _submit() async {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();

  //     try {
  //       final newUser = await _auth.createUserWithEmailAndPassword(
  //         email: _email,
  //         password: _password,
  //       );

  //       await _firestore.collection('users').doc(newUser.user!.uid).set({
  //         'first name': _firstname,
  //         'second name': _secondname,
  //         'email': _email,
  //         'username': _username,
  //         'password': _password,
  //       });

  //       // Navigate to the home page after registration is successful
  //       Navigator.of(context).push(MaterialPageRoute(
  //         builder: (context) => Homepage(),
  //       ));
  //       log("firstname" + _firstname.toString());
  //       log("secondname" + _secondname.toString());
  //       log("email" + _email.toString());
  //       log("usernamename" + _username.toString());
  //       log("password" + _password.toString());
  //     } catch (error) {
  //       // Handle registration errors here
  //       print('Error occurred while registering user: $error');
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<Registerbloc, Registerstate>(
            listener: (context, state) {
      if (state is Registersuccess) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Homepage(),
        ));
        log("firs tname" + _firstnameController.toString());
        log("second name" + _secondnameController.toString());
        log("email" + _emailController.toString());
        log("username" + _usernameController.toString());
        log("password" + _passwordController.toString());
      }
      if (state is Registerfailed) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.errorText)));
      }
      if (state is Registerloading) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            content: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
        // log("firstname" + _firstname.toString());
        // log("secondname" + _secondname.toString());
        // log("email" + _email.toString());
        // log("usernamename" + _username.toString());
        // log("password" + _password.toString());
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      log("state" + state.toString());
      // if (state is Loginfailed) {
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(SnackBar(content: Text(state.errorText)));
      // }

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 30.0),
                  //   child: Center(
                  //     child: Container(
                  //       margin: EdgeInsets.symmetric(
                  //         horizontal: 40,
                  //       ),
                  //       color: Colors.white,
                  //       child: Image(
                  //         image: AssetImage("assets/images/bag.png"),
                  //         height: 50,
                  //         width: 50,
                  //         fit: BoxFit.contain,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0, top: 70),
                    child: Text(
                      " Register Here",
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: 'firstname',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
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

                    // keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'firstname is required';
                      }

                      // if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      //   return 'Please enter a valid email';
                      // }

                      return null;
                    },

                    controller: _firstnameController,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: 'secondname',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
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
                    // keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'secondname is required';
                      }

                      // if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      //   return 'Please enter a valid email';
                      // }

                      return null;
                    },
                    controller: _secondnameController,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
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
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email is required';
                      }

                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }

                      return null;
                    },
                    controller: _emailController,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: 'username',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
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
                    //  keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'username is required';
                      }

                      // if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      //   return 'Please enter a valid email';
                      // }

                      return null;
                    },
                    controller: _usernameController,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
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
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }

                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }

                      return null;
                    },
                    controller: _passwordController,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: 'confirm Password',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
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
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }

                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }

                      return null;
                    },
                    controller: _passwordController,
                  ),
                  SizedBox(height: 28.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Color.fromARGB(255, 255, 157, 174),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        // side: BorderSide(color: Colors.white, width: 0.5)
                      ),
                      minimumSize: Size(444, 46),
                    ),
                    onPressed: () => BlocProvider.of<Registerbloc>(context).add(
                        Registerbutton(
                            firstname: _firstnameController.text,
                            secondname: _secondnameController.text,
                            email: _emailController.text,
                            username: _usernameController.text,
                            password: _passwordController.text)),
                    child: Text('Register'),

                    // style: ButtonStyle(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }));
  }
}
