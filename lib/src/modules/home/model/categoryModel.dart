// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String? str) =>
    List<CategoryModel>.from(
        json.decode(str!).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.parentId,
    required this.name,
    required this.thumbnail,
    required this.unitType,
  });

  int? id;
  dynamic? parentId;
  String? name;
  String? thumbnail;
  String? unitType;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        parentId: json["parent_id"],
        name: json["name"],
        thumbnail: json["thumbnail"],
        unitType: json["unit_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "name": name,
        "thumbnail": thumbnail,
        "unit_type": unitType,
      };
}
