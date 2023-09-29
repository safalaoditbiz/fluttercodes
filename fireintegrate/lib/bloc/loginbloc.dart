import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireintegrate/bloc/loginevent.dart';
import 'package:fireintegrate/bloc/loginstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginbloc extends Bloc<Loginevent, Loginstate> {
  Loginbloc() : super(Logininitial()) {
    on<Loginbutton>(login);
  }
  login(Loginbutton event, Emitter<Loginstate> emit) async {
    emit(Logininitial());
    emit(LoginLoading());
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(
          email: event.email, password: event.password);

      emit(Loginsuccess());
    } on FirebaseAuthException catch (e) {
      emit(Loginfailed(errorText: e.toString()));
    } catch (e) {
      emit(Loginfailed(errorText: e.toString()));
    }
  }
}
