import 'package:cat_fact_application/Data/models/fact.dart';

abstract class Repository {
  Future<String> fetchImages();

  Future<Fact> fetchFacts();
}
