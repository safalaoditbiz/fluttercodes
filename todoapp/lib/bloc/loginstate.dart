import 'package:flutter/cupertino.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class Loginloading extends LoginState {}

class LoginLoaded extends LoginState {}

class Loginfailed extends LoginState {
  final String errorText;
  Loginfailed({required this.errorText});
}
