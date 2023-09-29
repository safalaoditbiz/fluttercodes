import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/cubit/category_cubit.dart';
import 'package:meals_app/cubit/cubit/cubit/detail_cubit.dart';
import 'package:meals_app/cubit/cubit/namecat_cubit.dart';
import 'package:meals_app/screens/detailscreen.dart';

class Namecatscreen extends StatefulWidget {
  const Namecatscreen({super.key});

  @override
  State<Namecatscreen> createState() => _NamecatscreenState();
}

class _NamecatscreenState extends State<Namecatscreen> {
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F9),
      appBar: AppBar(
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
        backgroundColor: Color(0xffFA4A0C),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "The Meals",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w900, color: Colors.white),
        ),
        // leading: Icon(
        //   Icons.arrow_back_ios_new,
        //   size: 18,
        //   color: Colors.black,
        // ),
      ),
      body: BlocBuilder<NamecatCubit, NamecatState>(builder: (context, state) {
        if (state is Loadedstate4) {
          return ListView.builder(
              itemCount: state.namecatmodel.meals!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (() {
                    BlocProvider.of<MealdetailCubit>(context).getmeals2(
                        id: state.namecatmodel.meals![index]["idMeal"]!);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => Detailscreen())));
                  }),
                  child: Card(
                      elevation: 0,
                      color: Color(0xffFFFFFF),
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 21),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Row(
                            children: [
                              ClipOval(
                                  child: Image(
                                image: NetworkImage(state.namecatmodel
                                    .meals![index]["strMealThumb"]!),
                                height: 70,
                                width: 70,
                              )),
                              Padding(
                                padding: const EdgeInsets.only(left: 14),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 174,
                                      child: Text(
                                        state.namecatmodel.meals![index]
                                            ["strMeal"]!,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 14),
                                            child: Text(
                                              state.namecatmodel.meals![index]
                                                  ["idMeal"]!,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xffFA4A0C)),
                                            ),
                                          ),
                                          // Padding(
                                          //   padding:
                                          //       const EdgeInsets.only(left: 44),
                                          //   child: Container(
                                          //       decoration: BoxDecoration(
                                          //         color: Color(0xffFA4A0C),
                                          //         borderRadius:
                                          //             BorderRadius.circular(22),
                                          //         // border: Border.all(
                                          //         //   width: 0.25,
                                          //         // ),
                                          //       ),
                                          //       height: 20,
                                          //       width: 102,
                                          //       child: Row(children: [
                                          //         IconButton(
                                          //             icon: const Icon(
                                          //               Icons.remove,
                                          //               size: 8,
                                          //               color: Colors.white,
                                          //             ),
                                          //             onPressed: () {}),
                                          //         Text(
                                          //           "0",
                                          //           style: const TextStyle(
                                          //               fontWeight:
                                          //                   FontWeight.w400,
                                          //               fontSize: 10,
                                          //               color: Colors.white),
                                          //         ),
                                          //         IconButton(
                                          //             icon: const Icon(
                                          //               Icons.add,
                                          //               size: 8,
                                          //               color: Colors.white,
                                          //             ),
                                          //             onPressed: () {}),
                                          //       ])),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ))),
                );
              });
        }
        if (state is Loadingstate2) {
          return Center(
              child: CircularProgressIndicator(
            color: Color(0xffFA4A0C),
          ));
        }
        return SizedBox();
      }),
    );
  }
}
