import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/categoryscreen.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _register(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Save additional user data to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'name': nameController.text.trim(),
        'phone': phoneController.text.trim(),
        'email': emailController.text.trim(),
      });

      // Registration successful, navigate to the login screen
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Categorysrceen()));
    } catch (e) {
      // Handle registration errors
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Registration Error'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(60),
          )),
          toolbarHeight: 250,
          backgroundColor: Color(0xffFA4A0C),
          centerTitle: true,
          title: Text(
            "Register your account",
            style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 28,
                fontWeight: FontWeight.w900),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.black,
                  cursorWidth: 1,
                  controller: nameController,
                  decoration: InputDecoration(
                      //  labelText: 'Password',
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                      alignLabelWithHint: false,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFA4A0C))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFA4A0C))),
                      fillColor: Colors.black),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.black,
                  cursorWidth: 1,
                  controller: phoneController,
                  decoration: InputDecoration(
                      //  labelText: 'Password',
                      hintText: 'Mobile number',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                      alignLabelWithHint: false,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFA4A0C))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFA4A0C))),
                      fillColor: Colors.black),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.black,
                  cursorWidth: 1,
                  controller: emailController,
                  decoration: InputDecoration(
                      //  labelText: 'Password',
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                      alignLabelWithHint: false,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFA4A0C))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFA4A0C))),
                      fillColor: Colors.black),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.black,
                  cursorWidth: 1,
                  controller: passwordController,
                  decoration: InputDecoration(
                      //  labelText: 'Password',
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                      alignLabelWithHint: false,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFA4A0C))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFA4A0C))),
                      fillColor: Colors.black),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                height: 40,
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    backgroundColor: const Color(0xffFA4A0C),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  child: Text('Register'),
                  onPressed: () => _register(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
