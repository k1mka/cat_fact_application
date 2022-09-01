import 'dart:convert';
import 'package:cat_fact_application/Data/models/fact.dart';
import 'package:http/http.dart';

abstract class CatFactService {
  Future<Fact> fetchFacts();
}

class CatFactServiceImpl implements CatFactService {
  static const _scheme = 'https://';
  static const _catDomain = 'cat-fact.herokuapp.com';
  static const _randomFactEndpoint = '/facts/random?animal_type=cat';

  static const _catServiceUrl = '$_scheme$_catDomain';

  static const _randomCatFactUrl = '$_catServiceUrl$_randomFactEndpoint';

  @override
  Future<Fact> fetchFacts() async {
    final url = Uri.parse(_randomCatFactUrl);
    final response = await get(url);
    Map<String, dynamic> responseMapFact = json.decode(response.body);

    return Fact(
      responseMapFact['text'],
      DateTime.parse(responseMapFact['createdAt']),
    );
  }
}
