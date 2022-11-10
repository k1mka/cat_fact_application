import 'package:cat_fact_application/data/repository/repo.dart';
import 'package:cat_fact_application/data/repository/repo_impl.dart';
import 'package:cat_fact_application/data/services/cat_fact_service.dart';
import 'package:cat_fact_application/data/services/cat_image_service.dart';
import 'package:cat_fact_application/data/services/cat_storage_service.dart';
import 'package:get_it/get_it.dart';

// doc:
// creating global variable of getIt instance, so we could access locator from everywhere
final getIt = GetIt.instance;

void setupServiceLocator() {
  // doc:
  // creating instances of our services, using interfaces
  CatFactService catFactService = MockedCatFactService();
  CatImageService catImageService = CatImageServiceImpl();
  CatStorageService catStorageService = CatStorageServiceImpl();

  // doc:
  // registering singleton for interfaces types, putting some concrete implementation of it
  getIt.registerSingleton<CatFactService>(catFactService);
  getIt.registerSingleton<CatImageService>(catImageService);
  getIt.registerSingleton<CatStorageService>(catStorageService);

  // doc:
  // now implementation of out interfaces could be accessed from service locator
  getIt.registerSingleton<Repository>(
    RepositoryImpl(
      catFactService: getIt<CatFactService>(),
      catImagesService: getIt<CatImageService>(),
      catStorageService: getIt<CatStorageService>(),
    ),
  );
}
