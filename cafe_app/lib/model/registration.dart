class registration {
  String? email;

  late String username;
  late String password;

  registration({
    this.email,
    required this.username,
    required this.password,
  });

  factory registration.fromJson(Map<String, dynamic> json) {
    return registration(
      email: json["email"],
      username: json["username"],
      password: json["password"],
    );
  }
}
