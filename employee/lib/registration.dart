import 'package:employee/db.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 40),
                child: Text(
                  "Register Your Account",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.purple,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Container(
                height: 55,
                child: TextFormField(
                  cursorColor: Colors.purple,
                  cursorWidth: 1,
                  controller: _nameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.purple),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.purple),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.purple),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.purple),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.purple),
                      ),
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.purple)),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                height: 55,
                child: TextFormField(
                  cursorColor: Colors.purple,
                  cursorWidth: 1,
                  controller: _emailController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.purple),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.purple),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.purple),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.purple),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.purple),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.purple)),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                height: 55,
                child: TextFormField(
                  cursorColor: Colors.purple,
                  cursorWidth: 1,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.purple),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.purple),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.purple),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.purple),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.purple),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.purple)),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 5.0,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _register();
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    // Perform registration logic here
    // Save the user to the database
    Map<String, dynamic> user = {
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnEmail: email,
      DatabaseHelper.columnPassword: password,
    };
    int id = await DatabaseHelper.instance.insertUser(user);

    // Registration successful, show success message
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registration Successful'),
          content: Text('User ID: $id'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
