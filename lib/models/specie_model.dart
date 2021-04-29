import 'dart:convert';

import 'package:pokeapp/models/evolution_model.dart';

Specie specieFromJson(String str) => Specie.fromJson(json.decode(str));

String specieToJson(Specie data) => json.encode(data.toJson());

class Specie {
  Specie({
    this.evolutionChain,
    this.flavorTextEntries,
  });

  EvolutionChain? evolutionChain;
  List<FlavorTextEntry>? flavorTextEntries;

  factory Specie.fromJson(Map<String, dynamic> json) => Specie(
        evolutionChain: EvolutionChain.fromJson(json["evolution_chain"]),
        flavorTextEntries: List<FlavorTextEntry>.from(
            json["flavor_text_entries"]
                .map((x) => FlavorTextEntry.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "evolution_chain": evolutionChain!.toJson(),
        "flavor_text_entries":
            List<dynamic>.from(flavorTextEntries!.map((x) => x.toJson())),
      };
}

class EvolutionChain {
  EvolutionChain({
    this.url,
    this.data,
  });

  String? url;
  Evolutions? data;

  factory EvolutionChain.fromJson(Map<String, dynamic> json) => EvolutionChain(
        url: json["url"],
        data: null,
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class FlavorTextEntry {
  FlavorTextEntry({
    this.flavorText,
  });

  String? flavorText;

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      FlavorTextEntry(
        flavorText: json["flavor_text"].replaceAll("\n", " "),
      );

  Map<String, dynamic> toJson() => {
        "flavor_text": flavorText,
      };
}
