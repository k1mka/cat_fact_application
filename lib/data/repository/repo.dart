import 'package:cat_fact_application/Data/models/cat_fact_and_photo.dart';
import 'package:cat_fact_application/Data/models/fact.dart';

abstract class Repository {
  Future<String> fetchImages();

  Future<Fact> fetchFacts();

  Future<void> saveCatFact(CatFactAndPhoto catFactAndPhoto);

  Future<List<CatFactAndPhoto>> getShownCatFact();
}
