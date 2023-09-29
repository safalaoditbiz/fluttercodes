class registration {
  String? name;
  late String place;
  late String username;
  late String password;
  late String gender;

  registration(
      {this.name,
      required this.place,
      required this.username,
      required this.password,
      required this.gender});

  factory registration.fromJson(Map<String, dynamic> json) {
    return registration(
        name: json["name"],
        place: json["place"],
        username: json["username"],
        password: json["password"],
        gender: json['gender']);
  }
}
