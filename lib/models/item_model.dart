import 'dart:convert';

ItemModel itemModelFromJsonMap(Map<dynamic, dynamic> jsonList) =>
    ItemModel.fromJson(jsonList);

// ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
  ItemModel({
    this.cost,
    this.effectEntries,
    this.flingEffect,
    this.flingPower,
    this.id,
    this.name,
    this.sprites,
  });

  int cost;
  List<EffectEntry> effectEntries;
  dynamic flingEffect;
  dynamic flingPower;
  int id;
  String name;
  Sprites sprites;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        cost: json["cost"],
        effectEntries: List<EffectEntry>.from(
            json["effect_entries"].map((x) => EffectEntry.fromJson(x))),
        flingEffect: json["fling_effect"],
        flingPower: json["fling_power"],
        id: json["id"],
        name: json["name"],
        sprites: Sprites.fromJson(json["sprites"]),
      );

  Map<String, dynamic> toJson() => {
        "cost": cost,
        "effect_entries":
            List<dynamic>.from(effectEntries.map((x) => x.toJson())),
        "fling_effect": flingEffect,
        "fling_power": flingPower,
        "id": id,
        "name": name,
        "sprites": sprites.toJson(),
      };
}

class EffectEntry {
  EffectEntry({
    this.effect,
    this.language,
    this.shortEffect,
  });

  String effect;
  Language language;
  String shortEffect;

  factory EffectEntry.fromJson(Map<String, dynamic> json) => EffectEntry(
        effect: json["effect"],
        language: Language.fromJson(json["language"]),
        shortEffect: json["short_effect"],
      );

  Map<String, dynamic> toJson() => {
        "effect": effect,
        "language": language.toJson(),
        "short_effect": shortEffect,
      };
}

class Language {
  Language({
    this.name,
    this.url,
  });

  String name;
  String url;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Sprites {
  Sprites({
    this.spritesDefault,
  });

  String spritesDefault;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        spritesDefault: json["default"],
      );

  Map<String, dynamic> toJson() => {
        "default": spritesDefault,
      };
}
