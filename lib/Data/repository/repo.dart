abstract class Repository {
  Future<String> fetchImages();

  Future<Map> fetchFacts();
}
