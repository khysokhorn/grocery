// To parse this JSON data, do
//
//     final exclusiveProductModel = exclusiveProductModelFromJson(jsonString);

import 'dart:convert';

ExclusiveProductModel exclusiveProductModelFromJson(String? str) =>
    ExclusiveProductModel.fromJson(json.decode(str!));

String exclusiveProductModelToJson(ExclusiveProductModel data) =>
    json.encode(data.toJson());

class ExclusiveProductModel {
  ExclusiveProductModel({
    required this.result,
  });

  ProductExclusiveResultModel? result;

  factory ExclusiveProductModel.fromJson(Map<String, dynamic> json) =>
      ExclusiveProductModel(
        result: ProductExclusiveResultModel.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result!.toJson(),
      };
}

class ProductExclusiveResultModel {
  ProductExclusiveResultModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.startAt,
    required this.endAt,
    required this.isActivated,
    required this.items,
  });

  int? id;
  String? title;
  String? thumbnail;
  String? startAt;
  String? endAt;
  int? isActivated;
  List<ProductExclusiveItemModel>? items;

  factory ProductExclusiveResultModel.fromJson(Map<String, dynamic>? json) => ProductExclusiveResultModel(
        id: json!["id"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        startAt: json["start_at"],
        endAt: json["end_at"],
        isActivated: json["is_activated"],
        items: List<ProductExclusiveItemModel>.from(json["items"].map((x) => ProductExclusiveItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "thumbnail": thumbnail,
        "start_at": startAt,
        "end_at": endAt,
        "is_activated": isActivated,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class ProductExclusiveItemModel {
  ProductExclusiveItemModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.netWeight,
    required this.quantity,
    required this.packaging,
    required this.barcode,
    required this.price,
    required this.origin,
    required this.thumbnail,
    required this.description,
  });

  int? id;
  int? categoryId;
  String? name;
  String? netWeight;
  int? quantity;
  String? packaging;
  String? barcode;
  double? price;
  String? origin;
  String? thumbnail;
  String? description;

  factory ProductExclusiveItemModel.fromJson(Map<String, dynamic>? json) => ProductExclusiveItemModel(
        id: json!["id"],
        categoryId: json["category_id"],
        name: json["name"],
        netWeight: json["net_weight"],
        quantity: json["quantity"],
        packaging: json["packaging"],
        barcode: json["barcode"],
        price: json["price"].toDouble(),
        origin: json["origin"],
        thumbnail: json["thumbnail"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "net_weight": netWeight,
        "quantity": quantity,
        "packaging": packaging,
        "barcode": barcode,
        "price": price,
        "origin": origin,
        "thumbnail": thumbnail,
        "description": description,
      };
}
