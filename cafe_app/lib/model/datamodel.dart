// To parse this JSON data, do
//
//     final datamodel = datamodelFromJson(jsonString);

import 'dart:convert';

Datamodel datamodelFromJson(String str) => Datamodel.fromJson(json.decode(str));

String datamodelToJson(Datamodel data) => json.encode(data.toJson());

class Datamodel {
  final List<Datum>? data;

  Datamodel({
    this.data,
  });

  factory Datamodel.fromJson(Map<String, dynamic> json) => Datamodel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final String? name;
  final DateTime? date;
  final String? description;
  final String? imageUrl;

  Datum({
    this.name,
    this.date,
    this.description,
    this.imageUrl,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        description: json["description"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "description": description,
        "image_url": imageUrl,
      };
}
