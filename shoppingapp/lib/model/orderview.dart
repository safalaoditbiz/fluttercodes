// To parse this JSON data, do
//
//     final orderview = orderviewFromJson(jsonString);

import 'dart:convert';

List<Orderview> orderviewFromJson(String str) =>
    List<Orderview>.from(json.decode(str).map((x) => Orderview.fromJson(x)));

String orderviewToJson(List<Orderview> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Orderview {
  Orderview({
    required this.id,
    required this.amount,
    required this.payment,
    required this.orderdate,
    required this.item,
  });

  int id;
  double amount;
  String payment;
  String orderdate;
  List<Item> item;

  factory Orderview.fromJson(Map<String, dynamic> json) => Orderview(
        id: json["id"],
        amount: json["amount"],
        payment: json["payment"],
        orderdate: json["orderdate"],
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "payment": payment,
        "orderdate": orderdate,
        // "${orderdate.year.toString().padLeft(4, '0')}-${orderdate.month.toString().padLeft(2, '0')}-${orderdate.day.toString().padLeft(2, '0')}",
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.productTitle,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });

  String productTitle;
  String price;
  String imageUrl;
  String quantity;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        productTitle: json["productTitle"],
        price: json["price"],
        imageUrl: json["imageUrl"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productTitle": productTitle,
        "price": price,
        "imageUrl": imageUrl,
        "quantity": quantity,
      };
}
