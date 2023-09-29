// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   GoogleMapController? _controller;

//   static const LatLng _initialPosition =
//       const LatLng(37.7749, -122.4194); // San Francisco coordinates

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Maps'),
//       ),
//       body: GoogleMap(
//         mapType: MapType.satellite,
//         initialCameraPosition: CameraPosition(
//           target: _initialPosition,
//           zoom: 0.0,
//         ),
//         onMapCreated: (GoogleMapController controller) {
//           _controller = controller;
//         },
//       ),
//     );
//   }
// }
