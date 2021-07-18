// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    required this.result,
  });

  Result result;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class Result {
  Result({
    required this.product,
  });

  List<Product> product;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.unitId,
    required this.createdAt,
    required this.updatedAt,
    required this.cart,
  });

  int id;
  String title;
  String imageUrl;
  int unitId;
  DateTime createdAt;
  DateTime updatedAt;
  Cart cart;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        imageUrl: json["image_url"],
        unitId: json["unit_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        cart: Cart.fromJson(json["cart"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image_url": imageUrl,
        "unit_id": unitId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "cart": cart.toJson(),
      };
}

class Cart {
  Cart({
    required this.cartId,
    required this.productId,
    required this.qty,
    required this.createdAt,
    required this.updatedAt,
  });

  int cartId;
  int productId;
  int qty;
  DateTime createdAt;
  DateTime updatedAt;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        cartId: json["cart_id"],
        productId: json["product_id"],
        qty: json["qty"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "product_id": productId,
        "qty": qty,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
