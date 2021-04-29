import 'package:http/http.dart' as http;
import 'dart:convert';

class AbilityProvider {
  Future<String?> getAbility(String url) async {
    String? ability;
    final uri = Uri.parse(url);
    // final url = Uri.https(_url, '/api/v2/ability/$id');
    final resp = await http.get(uri);

    final decodedData = json.decode(resp.body);
    // print(decodedData["results"]);
    final List<dynamic> abilityList = decodedData["effect_entries"];
    abilityList.forEach((entrie) {
      if (entrie['language']['name'] == "en") ability = entrie['effect'];
    });

    return ability;
  }
}
