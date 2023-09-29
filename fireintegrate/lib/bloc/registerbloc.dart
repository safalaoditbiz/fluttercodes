import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fireintegrate/bloc/loginevent.dart';
import 'package:fireintegrate/bloc/loginstate.dart';
import 'package:fireintegrate/bloc/registerevent.dart';
import 'package:fireintegrate/bloc/registerstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Registerbloc extends Bloc<Registerevent, Registerstate> {
  Registerbloc() : super(Registerinitial()) {
    on<Registerbutton>(register);
  }
  register(Registerbutton event, Emitter<Registerstate> emit) async {
    emit(Registerinitial());
    emit(Registerloading());
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final _firestore = FirebaseFirestore.instance;
      final newUser = await auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      await _firestore.collection('users').doc(newUser.user!.uid).set({
        'first name': event.firstname,
        'second name': event.secondname,
        'email': event.email,
        'username': event.username,
        'password': event.password,
      });
      emit(Registersuccess());
    } on FirebaseAuthException catch (e) {
      emit(Registerfailed(errorText: e.toString()));
    } catch (error) {
      print('Error occurred while registering user: $error');
    }
  }
}
