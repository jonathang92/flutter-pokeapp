// To parse this JSON data, do
//
// final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  Pokemon({
    this.abilities,
    this.id,
    this.moves,
    this.name,
    this.sprites,
    this.stats,
    this.types,
  });

  List<AbilityElement> abilities;
  int id;
  List<Move> moves;
  String name;
  Sprites sprites;
  List<StatElement> stats;
  List<Type> types;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        abilities: List<AbilityElement>.from(
            json["abilities"].map((x) => AbilityElement.fromJson(x))),
        id: json["id"],
        moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
        name: json["name"],
        sprites: Sprites.fromJson(json["sprites"]),
        stats: List<StatElement>.from(
            json["stats"].map((x) => StatElement.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "id": id,
        "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
        "name": name,
        "sprites": sprites.toJson(),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
      };
}

class AbilityElement {
  AbilityElement({
    this.ability,
  });

  AbilityClass ability;

  factory AbilityElement.fromJson(Map<String, dynamic> json) => AbilityElement(
        ability: AbilityClass.fromJson(json["ability"]),
      );

  Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
      };
}

class AbilityClass {
  AbilityClass({
    this.name,
    this.url,
    this.effect,
  });

  String name;
  String url;
  String effect;

  factory AbilityClass.fromJson(Map<String, dynamic> json) => AbilityClass(
        name: json["name"],
        url: json["url"],
        effect: "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class MoveClass {
  MoveClass({
    this.name,
    this.url,
  });

  String name;
  String url;

  factory MoveClass.fromJson(Map<String, dynamic> json) => MoveClass(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Move {
  Move({
    this.move,
  });

  MoveClass move;

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: MoveClass.fromJson(json["move"]),
      );

  Map<String, dynamic> toJson() => {
        "move": move.toJson(),
      };
}

class Sprites {
  Sprites({
    this.frontDefault,
    this.frontShiny,
    this.other,
  });

  String frontDefault;
  String frontShiny;
  Other other;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        other: Other.fromJson(json["other"]),
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "other": other.toJson(),
      };
}

class Other {
  Other({
    this.officialArtwork,
  });

  OfficialArtwork officialArtwork;

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
      );

  Map<String, dynamic> toJson() => {
        "official-artwork": officialArtwork.toJson(),
      };
}

class OfficialArtwork {
  OfficialArtwork({
    this.frontDefault,
  });

  String frontDefault;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
      };
}

class StatElement {
  StatElement({
    this.baseStat,
    this.stat,
  });

  int baseStat;
  StatStat stat;

  factory StatElement.fromJson(Map<String, dynamic> json) => StatElement(
        baseStat: json["base_stat"],
        stat: StatStat.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "stat": stat.toJson(),
      };
}

class StatStat {
  StatStat({
    this.name,
  });

  String name;

  factory StatStat.fromJson(Map<String, dynamic> json) => StatStat(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Type {
  Type({
    this.type,
  });

  MoveClass type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        type: MoveClass.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type.toJson(),
      };
}
