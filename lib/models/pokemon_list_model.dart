// import 'dart:convert';

// List<PokemonList> pokemonListFromJson(String str) => List<PokemonList>.from(json.decode(str).map((x) => PokemonList.fromJson(x)));

// String pokemonListToJson(List<PokemonList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

import 'package:pokeapp/models/pokemon_model.dart';

List<PokemonList> pokemonListFromJsonList(List<dynamic> jsonList) =>
    List<PokemonList>.from(jsonList.map((x) => PokemonList.fromJson(x)));

class PokemonList {
  PokemonList({
    this.name,
    this.url,
    this.data,
  });

  String? name;
  String? url;
  Pokemon? data;

  factory PokemonList.fromJson(Map<String, dynamic> json) =>
      PokemonList(name: json["name"], url: json["url"], data: null);

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
