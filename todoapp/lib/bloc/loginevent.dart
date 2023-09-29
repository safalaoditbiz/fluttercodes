import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Loginwithusername extends LoginEvent {
  final String username;
  final String password;

  Loginwithusername({required this.username, required this.password});
  @override
  List<Object> get props => [];
}
