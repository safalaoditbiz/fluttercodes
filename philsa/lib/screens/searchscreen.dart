import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:philsa/screens/bookingscreen.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

import 'package:http/http.dart' as http;

import 'package:place_picker/place_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Searchscreen extends StatefulWidget {
  @override
  _SearchscreenState createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  TextEditingController searchController = TextEditingController();
  List<String> recentSearches = [];
  bool _istap = true;

  @override
  void initState() {
    super.initState();
    _loadRecentSearches();
  }

  void _loadRecentSearches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      recentSearches = prefs.getStringList('recentSearches') ?? [];
    });
  }

  void _addRecentSearch(String searchQuery) {
    if (searchQuery.isNotEmpty) {
      if (recentSearches.contains(searchQuery)) {
        recentSearches.remove(searchQuery);
      }
      recentSearches.insert(0, searchQuery);
      if (recentSearches.length > 4) {
        recentSearches.removeLast();
      }
      _saveRecentSearches();
    }
  }

  void _saveRecentSearches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('recentSearches', recentSearches);
  }

  void searchPlace(BuildContext context) async {
    String searchQuery = searchController.text;

    try {
      List<Location> locations = await locationFromAddress(searchQuery);

      if (locations.isNotEmpty) {
        LatLng selectedLocation = LatLng(
          locations.first.latitude,
          locations.first.longitude,
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Bookingscreen(
              location: selectedLocation,
              locationName: searchQuery,
            ),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Location Not Found'),
              content: Text('No results found for the given search query.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } on PlatformException catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(
                'An error occurred while searching for the location: ${e.message}'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void searchFromSuggestion(String suggestion) {
    setState(() {
      searchController.text = suggestion;
    });
    searchPlace(context);
  }
  // void showPlacePicker() async {
  //   LocationResult? result = await Navigator.of(context).push(MaterialPageRoute(
  // builder: (context) => PlacePicker(
  //       "AIzaSyDi_DGtmux9toLuAXxRmAVfOe65a8vGBEE",

  //     )));

  //   searchPlace(context);
  // }
  // void showPlacePicker() async {
  //   LocationResult? result =
  //       (await PlacePicker("AIzaSyDi_DGtmux9toLuAXxRmAVfOe65a8vGBEE"))
  //           as LocationResult?;

  //   if (result != null) {
  //     // Handle the location result here
  //     setState(() {
  //       searchController.text = result.formattedAddress ?? '';
  //     });
  //     searchPlace(context);
  //   } else {
  //     // Navigation was cancelled, do something else or show an error message
  //   }
  // }
  List<String> suggestions = [];
//  List<String> recentSearches = [];
  void _getSuggestions(String keyword) async {
    String apiKey = 'AIzaSyDi_DGtmux9toLuAXxRmAVfOe65a8vGBEE';
    String endpoint =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String url = '$endpoint?input=$keyword&key=$apiKey';

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['status'] == 'OK') {
        setState(() {
          suggestions = List<String>.from(data['predictions']
              .map((prediction) => prediction['description']));
        });
        return;
      }
    }

    // Error occurred or no suggestions found
    setState(() {
      suggestions = [];
    });
  }

  void onSuggestionSelected(String suggestion) {
    setState(() {
      searchController.text = suggestion;
    });
  }

  void clearRecentSearch(String searchQuery) {
    setState(() {
      recentSearches.remove(searchQuery);
    });
    _saveRecentSearches();
  }

  void clearRecentSearches() {
    setState(() {
      recentSearches.clear();
    });
    _saveRecentSearches();
  }

  String _textFieldValue = '';
  TextEditingController _textEditingController = TextEditingController();
  bool _isHintTextVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
              child: Container(
                height: 45,
                width: 320,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: TextField(
                    autofocus: true,
                    onChanged: (value) {
                      setState(() {
                        _textFieldValue = value;
                        _getSuggestions(value);

                        // updateSuggestions(value);
                      });
                    },
                    // controller: _textEditingController,
                    onTap: () {
                      setState(() {
                        _istap = false;
                        _textEditingController.text = 'New Value';
                        _isHintTextVisible = false;
                        //  showPlacePicker();
                      });
                    },
                    controller: searchController,
                    cursorColor: Colors.black,
                    cursorWidth: 0.5,
                    autocorrect: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15),
                      suffixIcon: IconButton(
                        icon: Image(
                            image: AssetImage("assets/images/search.png")),
                        onPressed: () {
                          searchPlace(context);

                          _addRecentSearch(searchController.text);
                        },
                      ),
                      hintText: _isHintTextVisible ? 'Search location' : '',
                      hintStyle: TextStyle(
                        color: Color(0xff111C22),
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(22),
                          ),
                          borderSide: BorderSide(width: 0.1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(22),
                          ),
                          borderSide: BorderSide(width: 0.1)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(22),
                          ),
                          borderSide: BorderSide(width: 0.1)),
                    ),
                  ),
                ),
              ),
            ),
            if (suggestions.isEmpty) Container(height: 0),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 258),
              child: Text(
                "Suggestions",
                style: TextStyle(
                    color: Color(0xff111C22),
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            if (suggestions.isNotEmpty)
              Container(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: suggestions.length,
                  // suggestions
                  //     .length, // Replace with the actual number of items
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 0, top: 0, right: 0),
                      child: Container(
                        height: 35,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: GestureDetector(
                                child: Container(
                                  height: 50,
                                  width: 300,
                                  child: GestureDetector(
                                    onTap: () {
                                      searchFromSuggestion(suggestions[index] +
                                          ' ' +
                                          searchController.text);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 80),
                                      child: Text(
                                        suggestions[index],
                                        style: TextStyle(
                                          color: Color(0xff111C22),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        //softWrap: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: IconButton(
                                icon: Image(
                                  image: AssetImage("assets/images/arrow.png"),
                                ),
                                onPressed: () {
                                  _addRecentSearch(searchController.text);
                                  searchFromSuggestion(suggestions[index] +
                                      ' ' +
                                      searchController.text);
                                  //   searchPlace(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            if (recentSearches.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Search",
                      style: TextStyle(
                          color: Color(0xff111C22),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                      onTap: clearRecentSearches,
                      child: Text(
                        "Clear History",
                        style: TextStyle(
                            color: Color.fromARGB(255, 62, 62, 62),
                            fontSize: 14,
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                  ],
                ),
              ),
            Container(
              height: 135,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: recentSearches
                    .length, // Replace with the actual number of items in your list
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, top: 0, right: 15),
                    child: Container(
                      height: 35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image(
                                  image: AssetImage("assets/images/load.png")),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: GestureDetector(
                                  onTap: () => searchController.text =
                                      recentSearches[index],
                                  child: Container(
                                    width: 240,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 80),
                                      child: Text(
                                        recentSearches[
                                            index], // Replace with your logic to get the location text
                                        style: TextStyle(
                                          color: Color(0xff111C22),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                              onTap: () =>
                                  clearRecentSearch(recentSearches[index]),
                              child: const Image(
                                  image: AssetImage("assets/images/into.png"))),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
