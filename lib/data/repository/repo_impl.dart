import 'package:cat_fact_application/data/models/cat_fact_and_photo.dart';
import 'package:cat_fact_application/data/models/fact.dart';
import 'package:cat_fact_application/data/repository/repo.dart';
import 'package:cat_fact_application/data/services/cat_fact_service.dart';
import 'package:cat_fact_application/data/services/cat_image_service.dart';
import 'package:cat_fact_application/data/services/cat_storage_service.dart';

// doc:
// implementation of Repository interface aggregates few services,
// each of which is responsible of manipulating data from concrete source (API, storage, 3rd party service)
class RepositoryImpl implements Repository {
  final CatImageService catImagesService;
  final CatFactService catFactService;
  final CatStorageService catStorageService;

  // doc:
  // we are using aggregation instead of composition for more flexibility
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
  Future<List<CatFactAndPhoto>> getShownCatFact() => catStorageService.getShownCatFact();

  // doc:
  // In our cases, all of the methods are single call of service methods.
  // However,the fact that repository os higher-level entity and knows about few services,
  // allows us to implement methods like this.
  // It is now used in the app and not declared in interface,
  // but it demonstrates one of the purposes of separation of service and repo entities.
  Future<void> fetchPhotoFactAndSave() async {
    final fact = await catFactService.fetchFacts();
    final photo = await catImagesService.fetchImages();
    final catFactAndPhoto = CatFactAndPhoto(photo, fact);
    await catStorageService.saveCatFact(catFactAndPhoto);
  }
}
