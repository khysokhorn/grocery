import 'dart:convert';

ProductItem productItemFromJson(String? str) =>
    ProductItem.fromJson(json.decode(str!));

String productItemToJson(ProductItem data) => json.encode(data.toJson());

class ProductItem {
  ProductItem({
    required this.result,
  });

  List<ProductResultModel> result;

  factory ProductItem.fromJson(Map<String?, dynamic>? json) => ProductItem(
        result: List<ProductResultModel>.from(json!["result"]
            .map((Map<String?, dynamic> x) => ProductResultModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class ProductResultModel {
  ProductResultModel({
    this.id,
    this.title,
    this.imageUrl,
    this.unitId,
    this.createdAt,
    this.updatedAt,
    this.unit,
    this.scale,
  });

  int? id;
  String? title;
  String? imageUrl;
  int? unitId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Unit? unit;
  List<Scale>? scale;

  factory ProductResultModel.fromJson(Map<String?, dynamic>? json) =>
      ProductResultModel(
        id: json!["id"],
        title: json["title"],
        imageUrl: json["image_url"],
        unitId: json["unit_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        unit: Unit.fromJson(json["unit"]),
        scale: List<Scale>.from(json["scale"].map((x) => Scale.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image_url": imageUrl,
        "unit_id": unitId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "unit": unit!.toJson(),
        "scale": List<dynamic>.from(scale!.map((x) => x.toJson())),
      };
}

class Scale {
  Scale({
    this.id,
    this.title,
    this.createdAt,
    this.updatedAt,
    this.itemPrice,
  });

  int? id;
  String? title;
  DateTime? createdAt;
  DateTime? updatedAt;
  ItemPrice? itemPrice;

  factory Scale.fromJson(Map<String, dynamic>? json) => Scale(
        id: json!["id"],
        title: json["title"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        itemPrice: ItemPrice.fromJson(json["item_price"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "item_price": itemPrice!.toJson(),
      };
}

class ItemPrice {
  ItemPrice({
    this.productId,
    this.scaleId,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  int? productId;
  int? scaleId;
  String? price;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ItemPrice.fromJson(Map<String, dynamic>? json) => ItemPrice(
        productId: json!["product_id"],
        scaleId: json["scale_id"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "scale_id": scaleId,
        "price": price,
      };
}

class Unit {
  Unit({
    this.id,
    this.title,
    this.unitOfMeasure,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? unitOfMeasure;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Unit.fromJson(Map<String, dynamic>? json) => Unit(
        id: json!["id"],
        title: json["title"],
        unitOfMeasure: json["unitOfMeasure"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "unitOfMeasure": unitOfMeasure,
      };
}
