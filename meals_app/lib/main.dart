import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/screens/categoryscreen.dart';
import 'package:meals_app/cubit/category_cubit.dart';
import 'package:meals_app/cubit/cubit/cubit/detail_cubit.dart';
import 'package:meals_app/cubit/cubit/namecat_cubit.dart';
import 'package:meals_app/screens/loginscreen.dart';
import 'package:meals_app/screens/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CategoryCubit>(
            create: (context) => CategoryCubit(),
          ),
          BlocProvider<NamecatCubit>(
            create: (context) => NamecatCubit(),
          ),
          BlocProvider<MealdetailCubit>(
            create: (context) => MealdetailCubit(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false, home: Splashscreen()));
  }
}
