import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/cubit/category_cubit.dart';
import 'package:meals_app/cubit/cubit/namecat_cubit.dart';
import 'package:meals_app/screens/loginscreen.dart';
import 'package:meals_app/screens/namecatscree.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';

class Categorysrceen extends StatefulWidget {
  Categorysrceen({
    super.key,
  });

  @override
  State<Categorysrceen> createState() => _CategorysrceenState();
}

class _CategorysrceenState extends State<Categorysrceen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final databaseRef = FirebaseDatabase.instance;
  Map<String, dynamic> data = {};

  String name = '';
  String phone = '';
  var snapshot = FirebaseFirestore.instance
      .collection('chat')
      .orderBy('createdAt', descending: true)
      .snapshots();

  Stream<DocumentSnapshot<Map<String, dynamic>>> _profile() {
    final User user = FirebaseAuth.instance.currentUser!;

    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .snapshots();
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Do you want to exit?"),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            print('yes selected');
                            exit(0);
                          },
                          child: Text("Yes"),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffFA4A0C),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          print('no selected');
                          Navigator.of(context).pop();
                        },
                        child:
                            Text("No", style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  void _signOut() async {
    FirebaseAuth.instance.signOut();
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(savelogin, false);

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (route) => false);
  }

  @override
  void initState() {
    BlocProvider.of<CategoryCubit>(context).getmeals3();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(60),
          )),
          toolbarHeight: 150,
          backgroundColor: Color(0xffFA4A0C),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(right: 0),
            child: Column(
              children: [
                Text(
                  "Delicious Foods",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 26,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  "For You",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 26,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          actions: [
            StreamBuilder(
                stream: _profile(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //   log("DATAS ===> ${snapshot.data?.data()?["username"]}");
                    log(snapshot.data!.data().toString());
                    name = snapshot.data?.data()?["name"];

                    phone = snapshot.data?.data()?["phone"];
                  }
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 110,
                    ),
                    child: Row(
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 12,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          phone,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 12,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.only(bottom: 110),
              child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 28.0),
                                child: Text(
                                  "Are you want to logout?",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 100,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 3,
                                            backgroundColor:
                                                const Color(0xffFA4A0C),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                          ),
                                          child: Text('Logout'),
                                          onPressed: _signOut),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 100,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            backgroundColor: Color(0xffFfffff),
                                            foregroundColor: Color(0xffFA4A0C),
                                          ),
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      });
                },
                icon: Icon(Icons.logout),
                color: Colors.white,
              ),
            )
          ],
        ),
        backgroundColor: Color(0xffF6F6F9),
        body: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
          if (state is Loadedstate3) {
            return Column(children: [
              // Padding(
              //   padding: EdgeInsets.only(top: 100.0, right: 200, left: 20),
              //   child: Container(
              //     child: Text(
              //       "Delicious food for you",
              //       style: TextStyle(
              //           fontSize: 24,
              //           fontWeight: FontWeight.w400,
              //           color: Colors.black),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 230, top: 20),
              //   child: Text(
              //     "Categories",
              //     style: TextStyle(
              //         fontSize: 17,
              //         fontWeight: FontWeight.w400,
              //         color: Color(0xffFA4A0C)),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Container(
                  height: 503,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 150,
                              childAspectRatio: 3 / 3,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: state.categorymodel.categories!.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                          onTap: (() {
                            BlocProvider.of<NamecatCubit>(context).getmeals4(
                              name: state
                                  .categorymodel.categories![index].strCategory
                                  .toString(),
                            );

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Namecatscreen()));
                          }),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image(
                                  image: NetworkImage(state.categorymodel
                                      .categories![index].strCategoryThumb
                                      .toString()),
                                  height: 100,
                                  width: 400,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Container(
                                    //     height: 20,
                                    //     width: 20,
                                    //     decoration: BoxDecoration(
                                    //         color: Colors.black,
                                    //         borderRadius:
                                    //             BorderRadius.circular(80)),
                                    //     child: Center(
                                    //       child: Text(
                                    //         state.categorymodel.categories![index]
                                    //             .idCategory
                                    //             .toString(),
                                    //         style: TextStyle(
                                    //             color: Colors.white,
                                    //             fontSize: 16,
                                    //             fontWeight: FontWeight.w900),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10.0,
                                        bottom: 10,
                                        top: 8,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 0.0),
                                        child: Text(
                                          state.categorymodel.categories![index]
                                              .strCategory
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: Text(
                                //     state.categorymodel.categories![index]
                                //         .strCategoryDescription
                                //         .toString(),
                                //     style: TextStyle(fontSize: 4),
                                //   ),
                                // ),
                                // Text(state.detailmodel.meals![0]["strCategory"]!),
                                // Text(state.detailmodel.meals![0]["idMeal"]!),
                                // Text(state.detailmodel.meals![0]["strArea"]!),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ]);
          }
          if (state is Loadingstate3) {
            return Center(
                child: CircularProgressIndicator(
              color: Color(0xffFA4A0C),
            ));
          }
          return SizedBox(
            height: 150,
            child: Container(
              color: Colors.white,
            ),
          );

          // if (state is LoadingState) {

          // }
          // if (state is ErrorState) {

          // }
        }),
      ),
    );
  }
}
