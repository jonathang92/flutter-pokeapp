import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokeapp/models/move_list_model.dart';
import 'package:pokeapp/models/move_model.dart';

class MoveListProvider {
  String _url = 'pokeapi.co';
  Future<List<dynamic>> getMoveList(int currentLength, int increment) async {
    final url = Uri.https(_url, '/api/v2/move/', {
      'offset': currentLength.toString(),
      'limit': increment.toString(),
    });
    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);
    final moveList = moveListFromJsonList(decodedData["results"]);
    await Future.forEach(moveList, (dynamic p) async {
      p.data = await getMove(p.url);
    });
    return moveList;
  }

  Future<MoveModel> getMove(url) async {
    final uri = Uri.parse(url);
    final resp = await http.get(uri);
    final decodedData = json.decode(resp.body);
    final detail = moveModelFromJsonMap(decodedData);
    return detail;
  }
}
