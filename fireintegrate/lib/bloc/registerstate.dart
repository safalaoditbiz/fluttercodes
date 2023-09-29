abstract class Registerstate {}

class Registerinitial extends Registerstate {}

class Registerloading extends Registerstate {}

class Registersuccess extends Registerstate {
  Registersuccess();
}

class Registerfailed extends Registerstate {
  final String errorText;
  Registerfailed({required this.errorText});
}
