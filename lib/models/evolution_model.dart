// To parse this JSON data, do
//
//     final evolutions = evolutionsFromJson(jsonString);

import 'dart:convert';

Evolutions evolutionsFromJson(String str) =>
    Evolutions.fromJson(json.decode(str));

String evolutionsToJson(Evolutions data) => json.encode(data.toJson());

class Evolutions {
  Evolutions({
    this.evolutionDetails,
    this.evolvesTo,
    this.species,
  });

  List<EvolutionDetail> evolutionDetails;
  List<Evolutions> evolvesTo;
  EvolutionsSpecies species;

  factory Evolutions.fromJson(Map<String, dynamic> json) => Evolutions(
        evolutionDetails: List<EvolutionDetail>.from(
            json["evolution_details"].map((x) => EvolutionDetail.fromJson(x))),
        evolvesTo: (json["evolves_to"] != null)
            ? List<Evolutions>.from(
                json["evolves_to"].map((x) => Evolutions.fromJson(x)))
            : null,
        species: EvolutionsSpecies.fromJson(json["species"]),
      );

  Map<String, dynamic> toJson() => {
        "evolution_details":
            List<EvolutionDetail>.from(evolutionDetails.map((x) => x)),
        "evolves_to": List<dynamic>.from(evolvesTo.map((x) => x.toJson())),
        "species": species.toJson(),
      };
}

class EvolutionDetail {
  EvolutionDetail({
    this.minLevel,
  });

  int minLevel;

  factory EvolutionDetail.fromJson(Map<String, dynamic> json) =>
      EvolutionDetail(
        minLevel: json["min_level"],
      );

  Map<String, dynamic> toJson() => {
        "min_level": minLevel,
      };
}

class EvolutionsSpecies {
  EvolutionsSpecies({
    this.name,
    this.url,
    this.image,
  });

  String name;
  String url;
  String image;

  factory EvolutionsSpecies.fromJson(Map<String, dynamic> json) =>
      EvolutionsSpecies(
        name: json["name"],
        url: json["url"],
        image:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${json["url"].split('/')[json["url"].split('/').length - 2]}.png",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
