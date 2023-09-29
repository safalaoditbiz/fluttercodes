// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todoapp/bloc/loginbloc.dart';
// import 'package:todoapp/bloc/loginevent.dart';
// import 'package:todoapp/bloc/loginstate.dart';
// import 'package:todoapp/screans/home.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LogintState();
// }

// class _LogintState extends State<Login> {
//   String? username;
//   String? password;
//   final usernamec = TextEditingController();
//   final passwordc = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: BlocBuilder<Loginbloc, LoginState>(builder: (context, state) {
//       return Container(
//         margin: EdgeInsets.symmetric(vertical: 250, horizontal: 30),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: usernamec,
//                 decoration: InputDecoration(hintText: 'username'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: passwordc,
//                 decoration: InputDecoration(hintText: 'password'),
//               ),
//             ),
//             BlocBuilder<Loginbloc, LoginState>(builder: (context, state) {
//               if (state is LoginLoaded) {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => Home(),
//                 ));
//               }
//               return TextButton(
//                   onPressed: () {
//                     BlocProvider.of<Loginbloc>(context).add(Loginwithusername(
//                         username: usernamec.text, password: passwordc.text));

//                     log("username" + usernamec.text);
//                     log("password" + passwordc.text);
//                     // Navigator.of(context).push(MaterialPageRoute(
//                     //   builder: (context) => Home(),
//                     // ));
//                   },
//                   child: Text("login"));
//             })
//           ],
//         ),
//       );
//     }));
//   }
// }
