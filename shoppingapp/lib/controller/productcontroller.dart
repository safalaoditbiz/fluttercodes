import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx22/model/product.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  List<dynamic> _items = [].obs;
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    var result;

    final url = "http://192.168.149.211:8080/shopgetx/shop.jsp";
    final response = await http.post(
      Uri.parse(
        url,
      ),
      /* body: jsonEncode(loginData),
        headers: {'Content-Type': 'application/json'}
 */
      // body: listdata(name, age),
      //headers: {'Content-Type': 'application/json'}
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("response.statusCode :" + response.statusCode.toString());

      print("request reply :" + response.body);
      var result = jsonDecode(response.body);
      // print(body);
      //   final Iterable json = body;

      _items = result.map((data) => new Product.fromJson(data)).toList();
    } else {
      print("Unable to perform request!");
      throw Exception("Unable to perform request!");
    }
  }

  List<Product> get items {
    return [..._items];
  }

  // List<Product> get favouriteItems {
  //   //return _items.where((productItem) => productItem.isFavourite).toList();
  // }

  Product findProductById(int id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void toggleFavouriteStatus(int id) {
    items[id].isFavourite = items[id].isFavourite;
    update();
  }
}
