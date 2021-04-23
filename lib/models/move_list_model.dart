// To parse this JSON data, do
//
//     final moveList = moveListFromJson(jsonString);

import 'move_model.dart';

List<MoveList> moveListFromJsonList(List<dynamic> jsonList) =>
    List<MoveList>.from(jsonList.map((x) => MoveList.fromJson(x)));

// MoveList moveListFromJson(String str) => MoveList.fromJson(json.decode(str));
// String moveListToJson(MoveList data) => json.encode(data.toJson());

class MoveList {
  MoveList({
    this.name,
    this.url,
    this.data,
  });

  String name;
  String url;
  MoveModel data;

  factory MoveList.fromJson(Map<String, dynamic> json) => MoveList(
        name: json["name"],
        url: json["url"],
        data: MoveModel(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
