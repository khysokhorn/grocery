// To parse this JSON data, do
//
//     final addToCartResModel = addToCartResModelFromJson(jsonString);

import 'dart:convert';

AddToCartResModel addToCartResModelFromJson(String str) =>
    AddToCartResModel.fromJson(json.decode(str));

String addToCartResModelToJson(AddToCartResModel data) =>
    json.encode(data.toJson());

class AddToCartResModel {
  AddToCartResModel({
    required this.result,
  });

  String result;

  factory AddToCartResModel.fromJson(Map<String, dynamic> json) =>
      AddToCartResModel(
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
      };
}
