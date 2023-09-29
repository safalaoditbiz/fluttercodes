import 'package:getx22/model/cartitem.dart';
import 'package:getx22/model/product.dart';

class Order {
  final String username;
  List<CartItem> products;
  final double amount;
  final String orderdate;
  // final String quantity;

  Order({
    required this.username,
    required this.products,
    required this.amount,
    // required this.quantity,
    required this.orderdate,

    // required String id
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      //id: json["id"],
      username: json["id"],
      products: json["products"],
      amount: json["amount"],
      // quantity: json["quantity"],
      orderdate: json["orderdate"],
      //     total_amount: json["total_amount"],
      //     shiping_charge: json["shiping_charge"],
      //     payment_type: json["payment_type"]
      // );
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'products': products,
        'amount': amount,
        "orderdate": orderdate
        // 'total_amount':total_amount,
        // 'shiping_charge':shiping_charge,
        // 'payment_type':payment_type,
        // 'location':location
      };
}

