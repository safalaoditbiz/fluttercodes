// import 'dart:ui';

// import 'package:cafe_app/pages/loginscreen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Color.fromARGB(255, 51, 34, 27),
//       // appBar: AppBar(title: Text("Splash Screen Example")),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//               color: Colors.white,
//               height: 440,
//               width: MediaQuery.of(context).size.width,
//               child: Image.asset("assets/images/cafe.png")),
//           Container(
//             // color: Colors.brown,
//             height: 280,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 65, 47, 39),
//                 borderRadius: BorderRadius.circular(16)),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     "WELCOME",
//                     style: TextStyle(
//                       fontStyle: FontStyle.normal,
//                       fontSize: 26,
//                       fontWeight: FontWeight.w900,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Text(
//                     " Placerat  laoreet  viverra  id  vestibulum  facilisis  hendrerit . Sapien  est ",
//                     style: TextStyle(
//                         fontStyle: FontStyle.normal,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.white),
//                   ),
//                 ),
//                 Center(
//                   child: SizedBox(
//                     height: 100,
//                     width: 250,
//                     child: Padding(
//                       padding: const EdgeInsets.all(28.0),
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.white, //background color of button
//                           //border width and color
//                           elevation: 3, //elevation of button
//                           shape: RoundedRectangleBorder(
//                               //to set border radius to button
//                               borderRadius: BorderRadius.circular(30)),
//                         ),
//                         onPressed: () {
//                           Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => Loginscreen()));
//                         },
//                         child: Text(
//                           "Get Started",
//                           style: TextStyle(
//                               color: Colors.black,
//                               backgroundColor: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
