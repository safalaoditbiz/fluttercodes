// import 'package:cafe_app/pages/gallery.dart';
// import 'package:cafe_app/pages/homescreen.dart';
// import 'package:cafe_app/pages/register.dart';
// import 'package:cafe_app/viewmodel/commonviewmodel.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:provider/provider.dart';

// import '../model/login.dart';

// class Loginscreen extends StatelessWidget {
//   Loginscreen({super.key});

//   late CommonListViewModel vm;

//   final formKey = GlobalKey<FormState>();

//   String? username;

//   String? password;

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController usename = new TextEditingController();
//     vm = Provider.of<CommonListViewModel>(context);
//     return Scaffold(
//         backgroundColor: Color.fromARGB(255, 65, 47, 39),
//         body: Column(children: [
//           Container(
//             height: 258,
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Padding(
//                 padding: const EdgeInsets.all(14.0),
//                 child: IconButton(
//                   onPressed: (() => HomeScreen()),
//                   icon: Icon(
//                     Icons.arrow_back_ios,
//                     color: Colors.white,
//                     size: 14,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   "Sign In",
//                   style: TextStyle(
//                     fontStyle: FontStyle.normal,
//                     fontSize: 32,
//                     fontWeight: FontWeight.w900,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Text(
//                   " Placerat  laoreet  viverra  id  vestibulum  facilisis  hendrerit . Sapien  est ",
//                   style: TextStyle(
//                       fontStyle: FontStyle.normal,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.white),
//                 ),
//               ),
//             ]),
//           ),
//           Container(
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(25)),
//               height: 462,
//               child: Form(
//                 key: formKey,
//                 child: Column(
//                   children: <Widget>[
//                     Padding(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//                       child: TextFormField(
//                         controller: usename,
//                         autofocus: true,
//                         onSaved: (value) => username = value!,
//                         decoration: InputDecoration(
//                           prefixIconColor: Colors.red,
//                           border: new OutlineInputBorder(
//                             borderRadius: new BorderRadius.circular(25.0),
//                             borderSide: new BorderSide(),
//                           ),
//                           labelText: 'usename',
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//                       child: TextFormField(
//                         autofocus: true,
//                         onSaved: (value) => password = value!,
//                         decoration: InputDecoration(
//                           border: new OutlineInputBorder(
//                             borderRadius: new BorderRadius.circular(30.0),
//                             borderSide: new BorderSide(),
//                           ),
//                           labelText: 'Password',
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
//                       child: SizedBox(
//                         height: 50,
//                         width: 200,
//                         child: TextButton(
//                           child: Text(
//                             "signin",
//                             style: TextStyle(fontSize: 18),
//                           ),
//                           onPressed: () {
//                             final form = formKey.currentState;
//                             if (form!.validate()) {
//                               form.save();

//                               final Future<Map<String, dynamic>>
//                                   successfulMessage =
//                                   vm.login(username!, password!);
//                               //cnfmpassword);

//                               print(username);

//                               print(password);
//                               //print(cnfmpassword);
//                               successfulMessage.then((response) {
//                                 usename.text;
//                                 print("response :" + response.toString());
//                                 if (response['status']) {
//                                   print(response);
//                                   Login login = response['user'];
//                                   if (username == login.username) {
//                                     Navigator.pushReplacement(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) => Gallery()));

//                                     //  Provider.of<UserProvider>(context, listen: false).setUser(user);

//                                   }
//                                 }
//                               });
//                             } else {
//                               print("form is invalid");
//                             }
//                           },
//                           style: TextButton.styleFrom(
//                               foregroundColor: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(28)),
//                               backgroundColor: Color.fromARGB(255, 62, 25, 8)),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(40.0),
//                       child: RichText(
//                         text: TextSpan(
//                             text: 'Don\'t have an account?',
//                             style: TextStyle(
//                                 color: Color.fromARGB(255, 90, 90, 90),
//                                 fontSize: 14),
//                             children: <TextSpan>[
//                               TextSpan(
//                                   text: ' Sign up',
//                                   style: TextStyle(
//                                       color: Color.fromARGB(255, 56, 38, 31),
//                                       fontSize: 16),
//                                   recognizer: TapGestureRecognizer()
//                                     ..onTap = () {})
//                             ]),
//                       ),
//                     ),
//                   ],
//                 ),
//               ))
//         ]));
//   }
// }
