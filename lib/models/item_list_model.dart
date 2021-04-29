// To parse this JSON data, do
//
//     final itemList = itemListFromJson(jsonString);

import 'dart:convert';

import 'package:pokeapp/models/item_model.dart';

List<ItemList> itemListFromJsonList(List<dynamic> jsonList) =>
    List<ItemList>.from(jsonList.map((x) => ItemList.fromJson(x)));

// ItemList itemListFromJson(String str) => ItemList.fromJson(json.decode(str));

String itemListToJson(ItemList data) => json.encode(data.toJson());

class ItemList {
  ItemList({
    this.name,
    this.url,
    this.data,
  });

  String? name;
  String? url;
  ItemModel? data;

  factory ItemList.fromJson(Map<String, dynamic> json) => ItemList(
        name: json["name"],
        url: json["url"],
        data: ItemModel(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
