import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/loginevent.dart';
import 'package:todoapp/bloc/loginstate.dart';
import 'package:todoapp/screans/login.dart';

class Loginbloc extends Bloc<LoginEvent, LoginState> {
  Loginbloc() : super(LoginInitial()) {
    on<Loginwithusername>(login);
  }
  login(Loginwithusername event, Emitter<LoginState> emit) async {
    emit(LoginInitial());
    try {} catch (e) {}
  }
}
