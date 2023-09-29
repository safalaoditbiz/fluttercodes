import 'package:firebase_core/firebase_core.dart';
import 'package:fireintegrate/bloc/loginbloc.dart';
import 'package:fireintegrate/bloc/registerbloc.dart';
import 'package:fireintegrate/credential/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocProvider(
          create: (context) => Loginbloc(),
        ),
        BlocProvider(
          create: (context) => Registerbloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            filled: true, //<-- SEE HERE
            fillColor: Colors.white,

            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(40.0),
            )

                //<-- SEE HERE
                ),
          ),
          hintColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const Login(),
      ),
    );
  }
}
