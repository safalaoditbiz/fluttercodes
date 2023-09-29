import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:philsa/screens/confirmationscreen.dart';
import 'package:philsa/screens/searchscreen.dart';

import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class Bookingscreen extends StatefulWidget {
  final List<int> hoursList = List<int>.generate(24, (index) => index);
  final LatLng location;
  String locationName;
  Bookingscreen({Key? key, required this.location, required this.locationName})
      : super(key: key);

  @override
  State<Bookingscreen> createState() => _BookingscreenState();
}

class _BookingscreenState extends State<Bookingscreen> {
  FocusNode _focusNode = FocusNode();
  String _textFieldValue = '';
  GoogleMapController? _controller;
  Position? _currentPosition;
  Set<Marker> _markers = {};

  // @override
  // void initState() {
  //   super.initState();
  //   _getCurrentLocation();
  // }

  // void _getCurrentLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Check if location services are enabled
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return;
  //   }

  //   // Check if app has permission to access the location
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.deniedForever) {
  //     return;
  //   }

  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission != LocationPermission.whileInUse &&
  //         permission != LocationPermission.always) {
  //       return;
  //     }
  //   }

  //   // Get the current location
  //   Position position = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   );

  //   setState(() {
  //     _currentPosition = position;
  //     _markers.add(
  //       Marker(
  //         markerId: MarkerId('current_location'),
  //         position: LatLng(position.latitude, position.longitude),
  //       ),
  //     );
  //   });

  //   // Animate the camera to the current position
  //   _controller?.animateCamera(
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //         target: LatLng(position.latitude, position.longitude),
  //         zoom: 12.0,
  //       ),
  //     ),
  //   );
  // }

  TextEditingController _textEditingController = TextEditingController();
  bool _isHintTextVisible = true;

  late final List<int> hoursList;
  int? selectedHour;
  void _showHourPickerDialog() {
    showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Hour'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.hoursList.length,
              itemBuilder: (BuildContext context, int index) {
                final hour = widget.hoursList[index];
                return ListTile(
                  title: Text('$hour'),
                  onTap: () {
                    setState(() {
                      selectedHour = hour;
                    });
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  // String _removeTime(String dateString) {
  //   DateTime dateTime = DateTime.parse(dateString);
  //   return _formatDate(dateTime);
  // }
  TimeOfDay _selectedTime = TimeOfDay.now();
  void _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  bool _isclick = true;
  @override
  Widget build(BuildContext context) {
    log('1h ===> ${1.h}');
    log('1w ===> ${1.w}');
    log('1sp ===> ${1.sp}');
    return Scaffold(
        appBar: AppBar(
          leading:
              // Icon(
              //   Icons.arrow_back,
              //   color: Colors.black,
              // ),
              Padding(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Searchscreen(),
                          ));
                    },
                    child: Container(
                        height: 33,
                        width: 230,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(width: 0.1)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: Container(
                                  width: 188,
                                  //   height: 50,
                                  child: Text(
                                    widget.locationName,
                                    style: TextStyle(
                                      color: Color(0xff7D7D7D),
                                      fontSize: 11.6.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
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
                  padding:
                      const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                  child: Image(image: AssetImage("assets/images/profile.png")),
                ),
              ],
            )
          ],
        ),
        body: _isclick
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        height: 282,
                        child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: widget.location,
                              zoom: 12.0,
                            ),
                            zoomControlsEnabled: false,
                            markers: Set<Marker>.from([
                              Marker(
                                markerId: MarkerId('selectedLocation'),
                                position: widget.location,
                              ),
                            ]))),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            height: 222,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Color(0xff7D7D7D40), width: 0.5)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 25),
                                  child: Image(
                                    image: AssetImage(
                                      "assets/images/car.png",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    "10 Slot",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff111C22)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Divider(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Parking Fee:",
                                        style: TextStyle(
                                            fontSize: 11.6.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff7D7D7D)),
                                      ),
                                      Text(
                                        "30",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff0EAA00)),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Extra Time:",
                                        style: TextStyle(
                                            fontSize: 11.6.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff7D7D7D)),
                                      ),
                                      Text(
                                        "10",
                                        style: TextStyle(
                                            fontSize: 11.6.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff0EAA00)),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 13),
                                  child: Container(
                                    height: 36,
                                    width: 120,
                                    child: TextButton(
                                      child: Text(
                                        "Book",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isclick = false;
                                        });
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) => Homescreen(),
                                        //     ));
                                      },
                                      style: TextButton.styleFrom(
                                          foregroundColor: Color(0xffFFFFFF),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          backgroundColor: Color(0xff16C2F4)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20, top: 20, bottom: 20),
                          child: Container(
                            height: 222,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Color(0xff7D7D7D40), width: 0.5)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 25),
                                  child: Image(
                                    image: AssetImage(
                                      "assets/images/bike.png",
                                    ),
                                    height: 22,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    "10 Slot",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff111C22)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Divider(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Parking Fee:",
                                        style: TextStyle(
                                            fontSize: 11.6.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff7D7D7D)),
                                      ),
                                      Text(
                                        "30",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff0EAA00)),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Extra Time:",
                                        style: TextStyle(
                                            fontSize: 11.6.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff7D7D7D)),
                                      ),
                                      Text(
                                        "10",
                                        style: TextStyle(
                                            fontSize: 11.6.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff0EAA00)),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 13),
                                  child: Container(
                                    height: 36,
                                    width: 120,
                                    child: TextButton(
                                      child: Text(
                                        "Book",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isclick = false;
                                        });
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) => Homescreen(),
                                        //     ));
                                      },
                                      style: TextButton.styleFrom(
                                          foregroundColor: Color(0xffFFFFFF),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          backgroundColor: Color(0xff16C2F4)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        height: 165,
                        child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: widget.location,
                              zoom: 12.0,
                            ),
                            zoomControlsEnabled: false,
                            markers: Set<Marker>.from([
                              Marker(
                                markerId: MarkerId('selectedLocation'),
                                position: widget.location,
                              ),
                            ]))),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 240, bottom: 5, top: 15),
                      child: Text(
                        "Vehicle Number",
                        style: TextStyle(
                          color: Color(0xff7D7D7D),
                          fontSize: 11.6.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Container(
                      height: 7.h,
                      width: 320,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: Color(0xff7D7D7D40), width: 0.25)),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 24, bottom: 0),
                        child: Focus(
                          focusNode: _focusNode,
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                _textFieldValue = value;
                              });
                            },
                            // controller: _textEditingController,
                            onTap: () {
                              setState(() {
                                _textEditingController.text = 'New Value';
                                _isHintTextVisible = false;
                              });
                            },
                            style: TextStyle(
                                color: Color(0xff111C22),
                                fontSize: 18,
                                fontWeight: FontWeight.w400),

                            cursorColor: Colors.black,
                            cursorWidth: 0.3,
                            autocorrect: true,
                            autofocus: false,
                            showCursor: true,

                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    top: 15, bottom: 15, left: 0),
                                hintText:
                                    _isHintTextVisible ? 'KL 53 AE 1406 ' : '',
                                hintStyle: TextStyle(
                                    color: Color(0xff111C22),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400)),
                            // style: TextStyle(
                            //   color: Color(0xff7D7D7D),
                            //   fontSize: 14,
                            //   fontWeight: FontWeight.w300,
                            // ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 240, bottom: 5, top: 15),
                      child: Text(
                        "Date Of Parking",
                        style: TextStyle(
                          color: Color(0xff7D7D7D),
                          fontSize: 11.6.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),

                    Container(
                      height: 7.h,
                      width: 320,
                      // margin: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: Color(0xff7D7D7D40), width: 0.25)),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_formatDate(selectedDate),
                                style: TextStyle(
                                    color: Color(0xff111C22),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400)),
                            GestureDetector(
                              onTap: () {
                                _focusNode.unfocus();
                                _selectDate(context);
                              },
                              child: Image(
                                  image: AssetImage(
                                "assets/images/wallet.png",
                              )),
                            ),
                          ],
                        ),

                        // style: TextStyle(
                        //   color: Color(0xff7D7D7D),
                        //   fontSize: 14,
                        //   fontWeight: FontWeight.w300,
                        // ),
                      ),
                    ),

                    // Container(
                    //   height: 52,
                    //   width: 320,
                    //   margin: EdgeInsets.symmetric(horizontal: 20),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(8),
                    //       border: Border.all(
                    //           color: Color(0xff7D7D7D40), width: 0.25)),
                    //   child: Padding(
                    //     padding:
                    //         const EdgeInsets.only(left: 20, top: 8, bottom: 7),
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(left: 0, right: 20),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text('12/10/2023',
                    //               style: TextStyle(
                    //                   color: Color(0xff111C22),
                    //                   fontSize: 18,
                    //                   fontWeight: FontWeight.w400)),
                    //           Image(
                    //               image: AssetImage(
                    //             "assets/images/wallet.png",
                    //           )),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 239, bottom: 5, top: 15),
                      child: Text(
                        "Time Of Parking",
                        style: TextStyle(
                          color: Color(0xff7D7D7D),
                          fontSize: 11.6.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Container(
                      height: 7.h,
                      width: 320,
                      // margin: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: Color(0xff7D7D7D40), width: 0.25)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_selectedTime.format(context),
                                style: TextStyle(
                                    color: Color(0xff111C22),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400)),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: GestureDetector(
                                onTap: () => _selectTime(context),
                                child: GestureDetector(
                                  onTap: () {
                                    _focusNode.unfocus();
                                    _selectTime(context);
                                  },
                                  child: Image(
                                      image: AssetImage(
                                    "assets/images/time2.png",
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // style: TextStyle(
                        //   color: Color(0xff7D7D7D),
                        //   fontSize: 14,
                        //   fontWeight: FontWeight.w300,
                        // ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 240, bottom: 5, top: 15),
                      child: Text(
                        "Expected Hour",
                        style: TextStyle(
                          color: Color(0xff7D7D7D),
                          fontSize: 11.6.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Container(
                      height: 7.h,
                      width: 320,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: Color(0xff7D7D7D40), width: 0.25)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                selectedHour != null
                                    ? selectedHour.toString() + ' Hour'
                                    : '3 Hour',
                                style: TextStyle(
                                    color: Color(0xff111C22),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400)),
                            GestureDetector(
                              onTap: () {
                                _focusNode.unfocus();
                                _showHourPickerDialog();
                              },
                              child: Image(
                                  image: AssetImage(
                                "assets/images/time2.png",
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        height: 7.h,
                        width: 320,
                        child: TextButton(
                          child: Text(
                            "Book Now",
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w500),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Confirmationscreen(),
                                ));
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Color(0xffFFFFFF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: Color(0xff16C2F4)),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
