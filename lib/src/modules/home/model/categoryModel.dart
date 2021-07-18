// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.result,
  });

  List<CategoryResultModel> result;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        result: List<CategoryResultModel>.from(
            json["result"].map((x) => CategoryResultModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class CategoryResultModel {
  CategoryResultModel(
      {required this.id, required this.title, required this.imageUrl});

  int id;
  String title;
  String imageUrl;

  factory CategoryResultModel.fromJson(Map<String, dynamic> json) =>
      CategoryResultModel(
        id: json["id"],
        title: json["title"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image_url": imageUrl,
      };
}
