import 'dart:convert';
import 'package:http/http.dart';

abstract class CatFactService {
  Future<Map> fetchFacts();
}

class CatFactServiceImpl implements CatFactService {
  @override
  Future<Map> fetchFacts() async {
    final url = Uri.parse(
        'https://cat-fact.herokuapp.com/facts/random?animal_type=cat');
    final response = await get(url);
    Map<String, dynamic> responseMapFact = json.decode(response.body);
    Map<String, dynamic> result = {};
    result['fact'] = responseMapFact['text'];
    result['date'] = responseMapFact['createdAt'];
    return result;

    // TODO: DIVIDE API URL TO STATIC VALUE
    // TODO: FORMAT DISPLAYED FACT AND DATA
    // TODO: CONVERT STRING RESPONSE TO DATA TIME TYPE
  }
}
