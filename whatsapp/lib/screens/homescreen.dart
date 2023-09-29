// import 'dart:html';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';


// class HomeScreen extends StatefulWidget {
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final List<String> chats = [
//     "John Doe",
//     "Jane Smith",
//     "Michael Johnson",
//     "Emily Brown",
//     "William Davis",
//     "fathima",
//     "Michael Johnson",
//     "Emily Brown",
//     "William Davis"
//   ];
//   final List<String> chats2 = [
//     "hi",
//     "good morninf"
//         "ok",
//     "bye",
//     "see you",
//     "miss you ",
//     "helllooo",
//     "Mmmn",
//     "ooooi",
//   ];
//   List<String> filteredChats = [];
//   @override
//   void initState() {
//     super.initState();
//     filteredChats = chats;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4, // Number of tabs (Chats, Status, Calls, Broadcast)
//       child: Scaffold(
//         appBar: AppBar(
//           toolbarHeight: 68,
//           backgroundColor: Theme.of(context).primaryColor,
//           title: Text(
//             "WhatsApp",
//             style: TextStyle(fontWeight: FontWeight.w500),
//           ),
//           actions: [
//             IconButton(
//               icon: Icon(Icons
//                   .camera_alt_outlined), // Change to broadcast icon (3 person icon)
//               onPressed: () {
//                 _showCameraOptions(context);
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.search),
//               onPressed: () {
//                 showSearch(
//                   context: context,
//                   delegate: ChatSearchDelegate(filteredChats),
//                 );
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.more_vert),
//               onPressed: () {
//                 // More options action
//               },
//             ),
//           ],
//           bottom: TabBar(
//             labelColor: Colors.white,
//             dividerColor: Colors.white,
//             tabs: [
//               Tab(icon: Icon(Icons.group)), // Broadcast icon (3 person icon)
//               Tab(text: "Chats"),
//               Tab(text: "Status"),
//               Tab(text: "Calls"),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             Center(child: Icon(Icons.group)), // Placeholder for broadcast tab
//             ListView.builder(
//               itemCount: chats2.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.only(top: 10),
//                   child: ListTile(
//                     leading: GestureDetector(
//                       onTap: () =>
//                           _showProfileImage(context), // Show image in dialog
//                       child: Container(
//                         height: 60,
//                         width: 60,
//                         child: CircleAvatar(
//                           backgroundImage: NetworkImage(
//                               "https://via.placeholder.com/150"), // Replace with actual profile image URL
//                         ),
//                       ),
//                     ),
//                     title: Text(
//                       chats[index],
//                       style:
//                           TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
//                     ),
//                     subtitle: Text(
//                       chats2[index],
//                       // "message ${chats[index]}",
//                       style:
//                           TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
//                     ),
//                     trailing: Text(
//                       "10:30 AM",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 12,
//                           color: Color.fromARGB(255, 103, 102, 102)),
//                     ),
//                   ),
//                 );
//               },
//             ),
//             StatusScreen(), // Custom status screen
//             CallsScreen(), // Custom calls screen
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: Color.fromARGB(255, 22, 168, 151),
//           onPressed: () {
//             // Add new chat action
//           },
//           child: Icon(
//             Icons.chat,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }

//   void _showProfileImage(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Container(
//             child: Image.network(
//               "https://via.placeholder.com/150", // Replace with the actual image URL
//               fit: BoxFit.cover,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class StatusScreen extends StatefulWidget {
//   @override
//   _StatusScreenState createState() => _StatusScreenState();
// }

// class _StatusScreenState extends State<StatusScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return NotificationListener<ScrollUpdateNotification>(
//       onNotification: (notification) {
//         if (notification.metrics.pixels > 50) {
//           // If the user has scrolled down at least 50 pixels, show the custom status design
//           return true;
//         }
//         return false;
//       },
//       child: ListView.builder(
//         itemCount: 20, // Number of status items
//         itemBuilder: (context, index) {
//           // Build your custom status items here
//           return ListTile(
//             leading: CircleAvatar(
//               backgroundImage: NetworkImage(
//                   "https://via.placeholder.com/150"), // Replace with actual profile image URL
//             ),
//             title: Text("Status $index"),
//             subtitle: Text("Status description"),
//             onTap: () {
//               // Handle status item tap
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class CallsScreen extends StatefulWidget {
//   @override
//   _CallsScreenState createState() => _CallsScreenState();
// }

// class _CallsScreenState extends State<CallsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return NotificationListener<ScrollUpdateNotification>(
//       onNotification: (notification) {
//         if (notification.metrics.pixels > 50) {
//           // If the user has scrolled down at least 50 pixels, show the custom calls design
//           return true;
//         }
//         return false;
//       },
//       child: ListView.builder(
//         itemCount: 20, // Number of call history items
//         itemBuilder: (context, index) {
//           // Build your custom call history items here
//           return ListTile(
//             leading: CircleAvatar(
//               backgroundImage: NetworkImage(
//                   "https://via.placeholder.com/150"), // Replace with actual profile image URL
//             ),
//             title: Text("Call $index"),
//             subtitle: Text("Call duration"),
//             onTap: () {
//               // Handle call history item tap
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// void _showCameraOptions(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return SafeArea(
//         child: Wrap(
//           children: [
//             ListTile(
//               leading: Icon(Icons.camera),
//               title: Text("Take Photo"),
//               onTap: () {
//                 _pickImage(ImageSource.camera);
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.photo_library),
//               title: Text("Choose from Gallery"),
//               onTap: () {
//                 _pickImage(ImageSource.gallery);
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

// void _pickImage(ImageSource source) async {
//   final picker = ImagePicker();
//   final pickedFile = await picker.pickImage(source: source);

//   if (pickedFile != null) {
//     // Handle the picked image here (e.g., upload, save, etc.)
//     // You can also navigate to a screen to display the picked image.
//     // The `pickedFile.path` contains the path of the picked image.
//   }
// }

// class ChatSearchDelegate extends SearchDelegate<String> {
//   final List<String> chats;

//   ChatSearchDelegate(this.chats);

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//           showSuggestions(context);
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: AnimatedIcon(
//         icon: AnimatedIcons.menu_arrow,
//         progress: transitionAnimation,
//       ),
//       onPressed: () {
//         close(context, '');
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     final filteredChats = chats
//         .where((chat) => chat.toLowerCase().startsWith(query.toLowerCase()))
//         .toList();

//     return ListView.builder(
//       itemCount: filteredChats.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           // ... Display your filtered chat items ...
//           title: Text(filteredChats[index]),
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final filteredChats = chats
//         .where((chat) => chat.toLowerCase().startsWith(query.toLowerCase()))
//         .toList();

//     return ListView.builder(
//       itemCount: filteredChats.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           // ... Display your suggested chat items ...
//           title: Text(filteredChats[index]),
//         );
//       },
//     );
//   }
// }