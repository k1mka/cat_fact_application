import 'package:cat_fact_application/data/models/cat_fact_and_photo.dart';
import 'package:cat_fact_application/data/models/fact.dart';
import 'package:cat_fact_application/data/repository/repo.dart';
import 'package:cat_fact_application/data/services/cat_fact_service.dart';
import 'package:cat_fact_application/data/services/cat_image_service.dart';
import 'package:cat_fact_application/data/services/cat_storage_service.dart';

class RepositoryImpl implements Repository {
  final CatImageService catImagesService;
  final CatFactService catFactService;
  final CatStorageService catStorageService;

  RepositoryImpl({
    required this.catImagesService,
    required this.catFactService,
    required this.catStorageService,
  });

  @override
  Future<String> fetchImages() async {
    final images = await catImagesService.fetchImages();
    return images;
  }

  @override
  Future<Fact> fetchFacts() async {
    final facts = await catFactService.fetchFacts();
    return facts;
  }

  @override
  Future<void> saveCatFact(CatFactAndPhoto catFactAndPhoto) async {
    await catStorageService.saveCatFact(catFactAndPhoto);
  }

  @override
  Future<List<CatFactAndPhoto>> getShownCatFact() =>
      catStorageService.getShownCatFact();
}
