import 'package:equatable/equatable.dart';

abstract class Loginevent extends Equatable {
  @override
  List<Object> get props => [];
}

class Loginbutton extends Loginevent {
  final String email;
  final String password;
  Loginbutton({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}
