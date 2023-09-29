import 'package:getx22/model/profile.dart';

class Profileitems {
  final String name;
  final String phone;
  final String address;

  Profileitems({
    required this.name,
    required this.phone,
    required this.address,
  });

  factory Profileitems.fromJson(Map<String, dynamic> json) {
    return Profileitems(
      name: json["name"],
      phone: json["phone"],
      address: json["address"],
    );
  }
}
