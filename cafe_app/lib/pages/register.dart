// import 'dart:developer';

// import 'package:cafe_app/model/registration.dart';
// import 'package:cafe_app/viewmodel/commonviewmodel.dart';
// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';

// class Register extends StatefulWidget {
//   registerstate createState() {
//     return registerstate();
//   }
// }

// // Create a corresponding State class. This class holds data related to the form.
// class registerstate extends State<Register> {
//   final formKey = GlobalKey<FormState>();

//   var _selectedGender;
//   String? email;
//   String? password;
//   String? username;

//   late CommonListViewModel vm;

//   @override
//   Widget build(BuildContext context) {
//     vm = Provider.of<CommonListViewModel>(context);
//     return Scaffold(
//         body: SingleChildScrollView(
//             child: Form(
//                 key: formKey,
//                 child: Column(
//                   children: [
//                     Padding(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 12,
//                           horizontal: 12,
//                         ),
//                         child: TextFormField(
//                             autofocus: true,
//                             onSaved: (value) => email = value!,
//                             decoration: InputDecoration(
//                                 labelText: 'email',
//                                 enabledBorder: OutlineInputBorder()))),
//                     Padding(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 12,
//                           horizontal: 12,
//                         ),
//                         child: TextFormField(
//                             autofocus: true,
//                             onSaved: (value) => username = value!,
//                             decoration: InputDecoration(
//                                 labelText: 'username',
//                                 enabledBorder: OutlineInputBorder()))),
//                     Padding(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//                       child: TextFormField(
//                           autofocus: true,
//                           obscureText: true,
//                           onSaved: (value) => password = value!,
//                           decoration: InputDecoration(
//                               labelText: 'password',
//                               enabledBorder: OutlineInputBorder())),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.symmetric(
//                             vertical: 5.0, horizontal: 115.0),
//                         child: TextButton(
//                           child: Text(
//                             "Register",
//                             style: TextStyle(fontSize: 25),
//                           ),
//                           onPressed: () {
//                             final form = formKey.currentState;
//                             if (form!.validate()) {
//                               form.save();

//                               final Future<Map<String, dynamic>>
//                                   successfulMessage = vm.register(
//                                 email!,
//                                 username!,
//                                 password!,
//                               );
//                               //cnfmpassword);

//                               log(email!);

//                               print(username);

//                               print(password);
//                               //print(cnfmpassword);
//                               successfulMessage.then((response) {
//                                 print("response :" + response.toString());
//                                 if (response['status']) {
//                                   print(response);
//                                   registration Registration = response['user'];

//                                   if (Registration.username == username) {}
//                                 }
//                                 child:
//                                 const Text('register');
//                               });
//                             } else {
//                               print("form is invalid");
//                             }
//                           },
//                         )),
//                   ],
//                 ))));
//   }
// }
