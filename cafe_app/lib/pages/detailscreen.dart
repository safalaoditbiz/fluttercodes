import 'dart:convert';

import 'package:cafe_app/model/datamodel.dart';
import 'package:cafe_app/pages/gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Detailscreen extends StatelessWidget {
  const Detailscreen({super.key});
  Future<Datamodel> readJSonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('lib/dummy.json');
    return Datamodel.fromJson(json.decode(jsondata));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "nameofimage",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: FutureBuilder(
            future: readJSonData(),
            builder: (context, data) {
              if (data.hasError) {
                return Text("${data.error}");
              } else if (data.hasData) {
                var items = data.data;

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 500,
                        child: Image.network(
                          items?.data?[1].imageUrl?.toString() ?? "",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            items?.data?[0].name?.toString() ?? "",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            items?.data?[0].date?.toString() ?? "",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            items?.data?[0].description?.toString() ?? "",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
              return SizedBox();
            }));
  }
}
