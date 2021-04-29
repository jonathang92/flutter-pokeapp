import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokeapp/models/item_list_model.dart';
import 'package:pokeapp/models/item_model.dart';

class ItemListProvider {
  String _url = 'pokeapi.co';
  Future<List<dynamic>> getItemList(int currentLength, int increment) async {
    final url = Uri.https(_url, '/api/v2/item/', {
      'offset': currentLength.toString(),
      'limit': increment.toString(),
    });
    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);
    final itemList = itemListFromJsonList(decodedData["results"]);
    await Future.forEach(itemList, (dynamic p) async {
      p.data = await getItem(p.url);
    });
    return itemList;
  }

  Future<ItemModel> getItem(url) async {
    final uri = Uri.parse(url);
    final resp = await http.get(uri);
    final decodedData = json.decode(resp.body);
    final detail = itemModelFromJsonMap(decodedData);
    return detail;
  }
}
