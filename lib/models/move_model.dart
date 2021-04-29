// To parse this JSON data, do
//
//     final moveModel = moveModelFromJson(jsonString);

import 'dart:convert';

MoveModel moveModelFromJsonMap(Map<dynamic, dynamic> jsonList) =>
    MoveModel.fromJson(jsonList as Map<String, dynamic>);
// MoveModel moveModelFromJson(String str) => MoveModel.fromJson(json.decode(str));

String moveModelToJson(MoveModel data) => json.encode(data.toJson());

class MoveModel {
  MoveModel({
    this.accuracy,
    this.effectEntries,
    this.id,
    this.name,
    this.power,
    this.pp,
    this.type,
  });

  int? accuracy;
  List<EffectEntry>? effectEntries;
  int? id;
  String? name;
  int? power;
  int? pp;
  Type? type;

  factory MoveModel.fromJson(Map<String, dynamic> json) => MoveModel(
        accuracy: json["accuracy"],
        effectEntries: List<EffectEntry>.from(
            json["effect_entries"].map((x) => EffectEntry.fromJson(x))),
        id: json["id"],
        name: json["name"],
        power: json["power"],
        pp: json["pp"],
        type: Type.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "accuracy": accuracy,
        "effect_entries":
            List<dynamic>.from(effectEntries!.map((x) => x.toJson())),
        "id": id,
        "name": name,
        "power": power,
        "pp": pp,
        "type": type!.toJson(),
      };
}

class EffectEntry {
  EffectEntry({
    this.effect,
    this.language,
    this.shortEffect,
  });

  String? effect;
  Type? language;
  String? shortEffect;

  factory EffectEntry.fromJson(Map<String, dynamic> json) => EffectEntry(
        effect: json["effect"],
        language: Type.fromJson(json["language"]),
        shortEffect: json["short_effect"],
      );

  Map<String, dynamic> toJson() => {
        "effect": effect,
        "language": language!.toJson(),
        "short_effect": shortEffect,
      };
}

class Type {
  Type({
    this.name,
  });

  String? name;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
