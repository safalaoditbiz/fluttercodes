import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/cubit/category_cubit.dart';
import 'package:meals_app/cubit/cubit/cubit/detail_cubit.dart';
import 'package:meals_app/cubit/cubit/cubit/detail_state.dart';
import 'package:meals_app/cubit/cubit/namecat_cubit.dart';
import 'package:meals_app/screens/namecatscree.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen({
    super.key,
  });

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  void initState() {
    // BlocProvider.of<MealdetailCubit>(context).getmeals2(name: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
          backgroundColor: Color(0xffFA4A0C),
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Details",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w900, color: Colors.white),
          ),
        ),
        backgroundColor: Color(0xffF6F6F9),
        // appBar: AppBar(
        //     elevation: 0,
        //     automaticallyImplyLeading: false,
        //     centerTitle: true,
        //     backgroundColor: Colors.white,
        //     title: Text(
        //       "Details",
        //       style: TextStyle(
        //           color: Colors.black,
        //           fontSize: 18,
        //           fontWeight: FontWeight.w900),
        //     )),
        body: BlocBuilder<MealdetailCubit, MealdetailState>(
            builder: (context, state) {
          log("st----------" + state.toString());
          if (state is Loadedstate2) {
            log(state.detailmodel.meals.toString());
            return SingleChildScrollView(
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(widget.name),
                  // ),

                  Container(
                    child: Column(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       top: 60, left: 34, right: 34),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       IconButton(
                        //           onPressed: (() {}),
                        //           icon: Icon(
                        //             Icons.arrow_back_ios,
                        //             size: 18,
                        //           )),
                        //       IconButton(
                        //           onPressed: (() {
                        //             Navigator.push(
                        //                 context,
                        //                 MaterialPageRoute(
                        //                   builder: (context) => Namecatscreen(),
                        //                 ));
                        //           }),
                        //           icon: Icon(
                        //             Icons.favorite_border,
                        //             size: 20,
                        //           ))
                        //     ],
                        //   ),
                        //),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: ClipOval(
                            child: Image(
                              height: 200,
                              width: 241,
                              image: NetworkImage(
                                  state.detailmodel.meals![0]["strMealThumb"]!),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 15),
                          child: Text(
                            state.detailmodel.meals![0]["strMeal"]!,
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text(
                          state.detailmodel.meals![0]["idMeal"]!,
                          style: TextStyle(
                            color: Color(0xffFA4A0C),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     children: [
                        //       Text(
                        //         "this is a ",
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.w500,
                        //             fontStyle: FontStyle.italic),
                        //       ),
                        //       Text(
                        //         state.detailmodel.meals![0]["strCategory"]!,
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.w500,
                        //             fontStyle: FontStyle.italic),
                        //       ),
                        //       Text(
                        //         " item",
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.w500,
                        //             fontStyle: FontStyle.italic),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 8.0),
                        //   child: Row(
                        //     children: [
                        //       Text(
                        //         "meals id: ",
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.w500,
                        //             fontStyle: FontStyle.italic),
                        //       ),
                        //       Text(
                        //         state.detailmodel.meals![0]["idMeal"]!,
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.w500,
                        //             fontStyle: FontStyle.italic),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     children: [
                        //       Text(
                        //         "its a ",
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.w500,
                        //             fontStyle: FontStyle.italic),
                        //       ),
                        //       Text(
                        //         state.detailmodel.meals![0]["strArea"]!,
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.w500,
                        //             fontStyle: FontStyle.italic),
                        //       ),
                        //       Text(
                        //         " food",
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.w500,
                        //             fontStyle: FontStyle.italic),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // Text(state.detailmodel.meals![0]["strIngredient1"]!),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(50),
                        ),
                        color: Color(0xffFA4A0C),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 188, top: 15, bottom: 4),
                            child: Text(
                              "How to prepare:-",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 41, right: 41),
                            child: Text(
                              state.detailmodel.meals![0]["strInstructions"]!,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is Loadingstate1) {
            return Center(
                child: CircularProgressIndicator(
              color: Color(0xffFA4A0C),
            ));
          }
          return const SizedBox();
        }));
  }
}
