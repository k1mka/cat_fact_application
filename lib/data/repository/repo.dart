import 'package:cat_fact_application/data/models/cat_fact_and_photo.dart';
import 'package:cat_fact_application/data/models/fact.dart';

// doc:
// Repository is an entity, that manipulates data.
// https://deviq.com/design-patterns/repository-pattern
// In our cases, it is an interface, that responsible for fetching and saving all types of data,
// that exists in our app.
abstract class Repository {
  Future<String> fetchImages();

  Future<Fact> fetchFacts();

  Future<void> saveCatFact(CatFactAndPhoto catFactAndPhoto);

  Future<List<CatFactAndPhoto>> getShownCatFact();
}
