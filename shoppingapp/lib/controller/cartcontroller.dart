import 'dart:core';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx22/model/cartitem.dart';
import 'package:getx22/model/product.dart';

class CartController extends GetxController {
  Map<int, CartItem> listitems = {};
  var total = 0.0;

  Map<int, CartItem> get items {
    return {...listitems};
  }

  int get itemCount {
    // return  _items?.length?? 0;
    return listitems.length;
  }

  double get totalAmount {
    double total = 0.0;
    listitems.forEach((key, cartItem) {
      total += cartItem.productPrice * cartItem.productQuantity;

      log("length==" + total.toString());
    });

    return total;
  }

  void increment(CartItem product) {
    log("increase =================");
    product.increase();
  }

  reducebyone(CartItem product) {
    log("deccccccccccccccccc =================");
    product.decrease();
  }

  void addItem(
      int productId, double price, String title, int quantity, String image) {
    log("cart ");
    log("idd===" + productId.toString());
    log("image ===" + image.toString());
    log("idd===" + price.toString());
    log("idd===" + title.toString());
    log("quantity===" + quantity.toString());
    if (listitems.containsKey(productId)) {
      listitems.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              imageUrl: existingCartItem.imageUrl,
              productTitle: existingCartItem.productTitle,
              productQuantity:
                  existingCartItem.quantity + existingCartItem.quantity,
              productPrice: existingCartItem.productPrice));
    } else {
      listitems.putIfAbsent(
        productId,
        () => CartItem(
          id: productId,
          imageUrl: image,
          productTitle: title,
          productPrice: price,
          productQuantity: quantity,
        ),
      );
    }
    update();
  }

  void removeitem(int productId) {
    log("inside function");
    listitems.remove(productId);
    log("remove id");
    update();
  }

  void clear() {
    listitems = {};
    update();
  }
}
