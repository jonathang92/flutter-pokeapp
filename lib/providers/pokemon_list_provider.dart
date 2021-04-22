import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokeapp/models/pokemon_list_model.dart';
import 'package:pokeapp/models/pokemon_model.dart';

class PokemonListProvider {
  String _url = 'pokeapi.co';
  Future<List<dynamic>> getPokemonList(int currentLength, int increment) async {
    final url = Uri.https(_url, '/api/v2/pokemon/', {
      'offset': currentLength.toString(),
      'limit': increment.toString(),
    });
    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);
    // print(decodedData["results"]);
    final pokemonList = pokemonListFromJsonList(decodedData["results"]);
    // print(pokemons[0].url);
    await Future.forEach(pokemonList, (p) async {
      p.data = await getPokemon(p.url);
    });
    // print(pokemonList[0].data.name);
    return pokemonList;
  }

  Future<Pokemon> getPokemon(url) async {
    final uri = Uri.parse(url);
    final resp = await http.get(uri);
    final decodedData = json.decode(resp.body);
    final detail = pokemonFromJson(json.encode(decodedData));
    return detail;
  }
}
