import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokeapp/models/specie_model.dart';
import 'package:pokeapp/models/evolution_model.dart';

class SpecieProvider {
  String _url = 'pokeapi.co';
  Future<Specie> getSpecie(int? id) async {
    final url = Uri.https(_url, '/api/v2/pokemon-species/$id');
    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);
    // print(decodedData["results"]);
    final specieData = specieFromJson(json.encode(decodedData));
    // print(pokemons[0].url);
    specieData.evolutionChain!.data =
        await getEvolution(specieData.evolutionChain!.url);
    // print(pokemonList[0].data.name);
    return specieData;
  }

  Future<Evolutions> getEvolution(url) async {
    final uri = Uri.parse(url);
    final resp = await http.get(uri);
    final decodedData = json.decode(resp.body);
    final detail = evolutionsFromJsonMap(decodedData['chain']);
    return detail;
  }
}
