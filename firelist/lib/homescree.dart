// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class StudentInfo extends StatefulWidget {
//   @override
//   _StudentInfoState createState() => _StudentInfoState();
// }

// class _StudentInfoState extends State<StudentInfo> {
//   // Firestore instance
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Student document ID
//   final String studentId = '1';

//   // Variables to store name and age
//   String? name;
//   String? age;

//   @override
//   void initState() {
//     super.initState();
//     // Call the method to fetch student data
//     fetchStudentData();
//   }

//   // Method to fetch student data from Firestore
//   void fetchStudentData() async {
//     try {
//       DocumentSnapshot studentSnapshot =
//           await _firestore.collection('student').doc(studentId).get();

//       // Extract name and age from the snapshot
//       name = studentSnapshot.get('name');
//       age = studentSnapshot.get('age');

//       // Update the state with the retrieved data
//       setState(() {});
//     } catch (e) {
//       print('Error fetching student data: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Student Info'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Name: $name',
//               style: TextStyle(fontSize: 24),
//             ),
//             Text(
//               'Age: $age',
//               style: TextStyle(fontSize: 24),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
