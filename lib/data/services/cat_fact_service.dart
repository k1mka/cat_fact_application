import 'dart:convert';
import 'package:cat_fact_application/data/models/fact.dart';
import 'package:http/http.dart';
// doc:
// declaring interface of the service. It responsibility is to manipulate data from
// concrete source (API, storage, 3rd party service).
abstract class CatFactService {
  Future<Fact> fetchFacts();
}

// doc:
// creating implementation of CatFactService.
class CatFactServiceImpl implements CatFactService {
  // moving all strings, keys etc to static fields. It is not as easy as using magic values everywhere,
  // but improves code readability and usability.
  // https://stackoverflow.com/questions/47882/what-is-a-magic-number-and-why-is-it-bad
  static const _scheme = 'https://';
  static const _catDomain = 'cat-fact.herokuapp.com';
  static const _randomFactEndpoint = '/facts/random?animal_type=cat';

  static const _catServiceUrl = '$_scheme$_catDomain';

  static const _randomCatFactUrl = '$_catServiceUrl$_randomFactEndpoint';

  static const _textKey = 'text';
  static const _createdAtKey = 'createdAt';

  // doc:
  // this method uses http package to fetch data and parse response.
  @override
  Future<Fact> fetchFacts() async {
    final url = Uri.parse(_randomCatFactUrl);
    final response = await get(url);
    Map<String, dynamic> responseMapFact = json.decode(response.body);

    return Fact(
      responseMapFact[_textKey],
      DateTime.parse(responseMapFact[_createdAtKey]),
    );
  }
}

// doc:
// creating mocked implementation of CatFactService.
// Fun fact: resolving all dependencies with interfaces helped a lot during passing this test task.
// A couple of hours before deadline, heroku server,
// that was listed in requirements and used for fetching facts, shut down and app stopped working.
// But coz all of the code was depending of the abstraction, but not implementation,
// (https://en.wikipedia.org/wiki/Dependency_inversion_principle)
// it was pretty easy to fix this - we just created another implementation
// and changed it in the service locator.
// All code was working the same as before, but with mocked data.
// It was much more flexible that changing working implementation of CatFactServiceImpl
// (commenting working code and uncommenting it when server back alive or something like that).
class MockedCatFactService implements CatFactService {
  @override
  Future<Fact> fetchFacts() async =>
      Fact('Random fact!' * 1000, DateTime.now());
}
