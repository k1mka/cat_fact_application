import 'dart:convert';

import 'package:http/http.dart';

abstract class CatFactService {
  Future<String> fetchFacts();
}

class CatFactServiceImpl implements CatFactService {
  @override
  Future<String> fetchFacts() async {
    final url = Uri.parse(
        'https://cat-fact.herokuapp.com/facts/random?animal_type=cat');
    final response = await get(url);
    Map<String, dynamic> responseMapFacts = json.decode(response.body);
    return responseMapFacts['text'];
    // TODO: DIVIDE API URL TO STATIC VALUE
  }
}
