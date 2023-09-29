import 'dart:developer';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/wishitem.dart';

class WishController extends GetxController {
  Map<int, wishtItem> listitems = {};

  Map<int, wishtItem> get items {
    return {...listitems};
  }

  int get itemCount {
    // return  _items?.length?? 0;
    return listitems.length;
  }

  double get totalAmount {
    var total = 0.0;
    listitems.forEach((key, wishtItem) {
      total += wishtItem.productPrice * 1;
    });
    return total;
  }

  void addItem(
      int productId, double price, String title, int quantity, String image) {
    log("Whishlist");
    log("idd===" + productId.toString());
    log("image ===" + image.toString());
    log("idd===" + price.toString());
    log("idd===" + title.toString());
    log("idd===" + quantity.toString());
    if (listitems.containsKey(productId)) {
      listitems.update(
          productId,
          (existingwishItem) => wishtItem(
              id: existingwishItem.id,
              image: existingwishItem.image,
              productTitle: existingwishItem.productTitle,
              productPrice: existingwishItem.productPrice));
    } else {
      listitems.putIfAbsent(
        productId,
        () => wishtItem(
          id: productId,
          image: image,
          productTitle: title,
          productPrice: price,
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
