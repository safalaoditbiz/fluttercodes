import 'dart:developer';

import 'package:flutter/widgets.dart';

class CartItem {
  final int id;
  final String imageUrl;
  final String productTitle;
  int productQuantity;
  final double productPrice;

  var quantity;

  CartItem(
      {required this.id,
      required this.imageUrl,
      required this.productTitle,
      required this.productQuantity,
      required this.productPrice});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      imageUrl: json['imageUrl'],
      productTitle: json['productTitle'],
      productQuantity: json['productQuantity'],
      productPrice: json['productPrice'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'imageUrl': imageUrl,
        'productTitle': productTitle,
        'productQuantity': productQuantity,
        'productPrice': productPrice,

        // 'payment_type':payment_type,
        // 'location':location
      };
  void increase() {
    productQuantity++;
    log("qty ===" + productQuantity.toString());
  }

  void decrease() {
    productQuantity--;
    log("qty ===" + productQuantity.toString());
  }
}
