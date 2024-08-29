import 'package:ngo/models/product.dart';
import 'dart:convert';

class Order {
  final String id;
  final List<Product> products;
  final List<int> quantity;
  final String userId;
  final DateTime orderedAt;
  final int status;
  final double totalPrice;

  Order({
    required this.id,
    required this.products,
    required this.quantity,
    required this.userId,
    required this.orderedAt,
    required this.status,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'products': products.map((x) => x.toMap()).toList(),
      'quantity': quantity,
      'userId': userId,
      'orderedAt': orderedAt.toIso8601String(),
      'status': status,
      'totalPrice': totalPrice,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    print('Order from Map: $map'); // Debugging

    List<Product> productsList = map['product'] != null
        ? List<Product>.from(
            [map['product']].map((x) => Product.fromMap(x)))
        : [];

    List<int> quantityList = map['quantity'] != null
        ? List<int>.from([map['quantity']])
        : [];

    return Order(
      id: map['_id'] ?? '',
      products: productsList,
      quantity: quantityList,
      userId: map['userId'] ?? '',
      orderedAt: DateTime.parse(map['orderedAt'] ?? ''), 
      status: map['status']?.toInt() ?? 0,
      totalPrice: map['totalPrice']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
