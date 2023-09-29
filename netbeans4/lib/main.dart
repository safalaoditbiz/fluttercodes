// ignore_for_file: dead_code, empty_statements, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netbeans4/model/list.dart';
import 'package:netbeans4/viewmodel/commonviewmodel.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CommonListViewModel>(
        create: (context) => CommonListViewModel(user: null),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
            primarySwatch: Colors.blue,
          ),
          home: MyAppState(),
        ));
  }
}

class MyAppState extends StatelessWidget {
  CommonListViewModel vm;
  final formKey = GlobalKey<FormState>();

  @override
  // ignore: dead_code, dead_code
  Widget build(BuildContext context) {
    vm = Provider.of<CommonListViewModel>(context);
    return Scaffold(
        body: FutureBuilder(
            future: vm.getlist(),
            // ignore: missing_return
            builder: (BuildContext context,
                AsyncSnapshot<List<CommonListViewModel>> snapshot) {
              print("snapshot" + snapshot.data.toString());
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: vm.choices.length,
                        itemBuilder: (BuildContext context, int index) {
                          final list = vm.choices[index];
                          print("++++++++++++++++++++++++++" +
                              list.age.toString());
                          return Center(
                            child: Container(
                              child: Text(
                                list.name + list.age,
                                style: TextStyle(
                                    color: Colors.black26,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        });
                  }

                default:
                  return CircularProgressIndicator();
              }
            }));
  }
}
