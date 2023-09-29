import 'package:equatable/equatable.dart';

abstract class Registerevent extends Equatable {
  @override
  List<Object> get props => [];
}

class Registerbutton extends Registerevent {
  final String firstname;
  final String secondname;
  final String email;
  final String username;
  final String password;
  Registerbutton(
      {required this.firstname,
      required this.secondname,
      required this.email,
      required this.username,
      required this.password});
  @override
  List<Object> get props => [email, password];
}
