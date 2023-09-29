import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:philsa/screens/searchscreen.dart';
import 'package:sizer/sizer.dart';
import 'package:place_picker/place_picker.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  GoogleMapController? _controller;
  Position? _currentPosition;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    // Check if app has permission to access the location
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return;
      }
    }

    // Get the current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = position;
      _markers.add(
        Marker(
          markerId: MarkerId('current_location'),
          position: LatLng(position.latitude, position.longitude),
        ),
      );
    });

    // Animate the camera to the current position
    _controller?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 12.0,
        ),
      ),
    );
  }

  // void showPlacePicker() async {
  //   LocationResult? result = await Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) =>
  //           PlacePicker("AIzaSyDi_DGtmux9toLuAXxRmAVfOe65a8vGBEE")));
  // }

  @override
  Widget build(BuildContext context) {
    log('1h ===> ${1.h}');
    log('1w ===> ${1.w}');
    log('1sp ===> ${1.sp}');
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
          child: SvgPicture.asset(
            "assets/images/menu.svg",
          ),
        ),
        elevation: 0,
        backgroundColor: Color(0xffFFFFFF),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell(
                  onTap: () {
                    // setState(() {
                    //   showPlacePicker();
                    // });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Searchscreen(),
                        ));
                  },
                  child: Container(
                      height: 33,
                      width: 63.9.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(width: 0.1)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Search Location",
                              style: TextStyle(
                                color: Color(0xff7D7D7D),
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Image(
                                image: AssetImage(
                              "assets/images/search.png",
                            )),
                          ],
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                child: Image(image: AssetImage("assets/images/profile.png")),
              ),
            ],
          )
        ],
      ),
      body: _currentPosition != null
          ? GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  _currentPosition!.latitude,
                  _currentPosition!.longitude,
                ),
                zoom: 12.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
              markers: _markers,
              zoomControlsEnabled: false,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   if (_currentPosition != null) {
      //     // Navigator.push(
      //     //     context,
      //     //     MaterialPageRoute(
      //     //       builder: (context) => MapScreen(),
      //     //     ));
      //     showDialog(
      //         context: context,
      //         builder: (BuildContext context) {
      //           return AlertDialog(
      //               title: Text('Current Address'),
      //               content: Text(_currentAddress ?? 'Address not found'));
      //         });
      //   }
      // }),
    );
  }
}
