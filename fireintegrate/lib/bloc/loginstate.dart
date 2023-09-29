abstract class Loginstate {}

class Logininitial extends Loginstate {}

class LoginLoading extends Loginstate {}

class Loginsuccess extends Loginstate {
  Loginsuccess();
}

class Loginfailed extends Loginstate {
  final String errorText;
  Loginfailed({required this.errorText});
}
