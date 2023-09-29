import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart' as rootBundle;

import 'package:cafe_app/model/datamodel.dart';
import 'package:cafe_app/pages/detailscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/services.dart';
import "package:cafe_app/service/webservice.dart";

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  Future<Datamodel> readJSonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('lib/dummy.json');
    return Datamodel.fromJson(json.decode(jsondata));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FutureBuilder(
              future: readJSonData(),
              builder: (context, data) {
                if (data.hasError) {
                  return Text("${data.error}");
                } else if (data.hasData) {
                  var items = data.data;
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: items?.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Detailscreen(),
                                ));
                          }),
                          child: Card(
                              color: Colors.amber,
                              child: Center(
                                  child: Image(
                                image: NetworkImage(
                                    items?.data?[index].imageUrl?.toString() ??
                                        ""),
                              ))),
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }
}
