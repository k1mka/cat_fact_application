import 'package:cat_fact_application/Data/repository/repo.dart';
import 'package:cat_fact_application/Data/servises/cat_fact_service.dart';
import 'package:cat_fact_application/Data/servises/cat_image_service.dart';

class RepositoryImpl extends Repository {
  final CatImageService catImagesService;
  final CatFactService catFactService;

  RepositoryImpl({
    required this.catImagesService,
    required this.catFactService,
  });
  @override
  Future<String> fetchImages() async {
    final images = await catImagesService.fetchImages();
    return images;
  }

  @override
  Future<Map> fetchFacts() async {
    final facts = await catFactService.fetchFacts();
    return facts;
  }
}
