import 'package:cat_fact_application/Data/repository/repo.dart';
import 'package:cat_fact_application/Data/servises/cat_fact_service.dart';
import 'package:cat_fact_application/Data/servises/cat_image_service.dart';

class RepositoryImpl extends Repository {
  final CatImagesServiceImpl catImagesServiceImpl;
  final CatFactServiceImpl catFactServiceImpl;

  RepositoryImpl(this.catImagesServiceImpl, this.catFactServiceImpl);
  @override
  Future<String> fetchImages() async {
    final images = await catImagesServiceImpl.fetchImages();
    return images;
  }

  @override
  Future<String> fetchFacts() {
    final facts = catFactServiceImpl.fetchFacts();
    return facts;
  }
}
