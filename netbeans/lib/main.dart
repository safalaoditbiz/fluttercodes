import 'package:flutter/material.dart';
import 'package:netbeans/model/login.dart';
import 'package:netbeans/model/registration.dart';
import 'package:netbeans/pages/register.dart';
import 'package:netbeans/service/webservice.dart';
import 'package:netbeans/pages/homepage.dart';
import 'package:netbeans/viewmodel/commonviewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}                                             

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CommonListViewModel>(
        create: (context) => CommonListViewModel(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
            primarySwatch: Colors.blue,
          ),
          home: MyAppState(),
        ));
  }
}

class MyAppState extends StatelessWidget {
  late CommonListViewModel vm;
  final formKey = GlobalKey<FormState>();

  String? username;

  String? password;

  @override
  // ignore: dead_code, dead_code
  Widget build(BuildContext context) {
    1 TextEditingController usename = new TextEditingController();
    vm = Provider.of<CommonListViewModel>(context);
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
                key: formKey,
                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    child: TextFormField(
                     2  controller: usename,
                      autofocus: true,
                      onSaved: (value) => username = value!,
                      validator: (value) =>
                          value!.isEmpty ? "Please enter name" : null,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                          hintText: 'Enter Your Name',
                          enabledBorder: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    child: TextFormField(
                      autofocus: true,
                      onSaved: (value) => password = value!,
                      validator: (value) =>
                          value!.isEmpty ? "Please enter name" : null,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          enabledBorder: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 125.0),
                    child: TextButton(
                      child: Text(
                        "_buttonText",
                        style: TextStyle(fontSize: 25),
                      ),
                      onPressed: () {
                        final form = formKey.currentState;
                        if (form!.validate()) {
                          form.save();

                          final Future<Map<String, dynamic>> successfulMessage =
                              vm.login(username!, password!);
                          //cnfmpassword);

                          print(username);

                          print(password);
                          //print(cnfmpassword);
                          successfulMessage.then((response) {
                           3 usename.text;
                            print("response :" + response.toString());
                            if (response['status']) {
                              print(response);
                              Login login = response['user'];
                              if (username == login.username) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => homepage()));

                                //Provider.of<UserProvider>(context, listen: false).setUser(user);

                              }
                            }
                          });
                        } else {
                          print("form is invalid");
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                          elevation: 2,
                          backgroundColor: Colors.amber),
                    ),
                  ),
                  TextButton(
                      child: Text(
                        "_buttonText",
                        style: TextStyle(fontSize: 25),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => register()));
                      })
                ]))));
  }
}
