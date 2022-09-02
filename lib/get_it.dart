import 'package:cat_fact_application/data/repository/repo.dart';
import 'package:cat_fact_application/data/repository/repo_impl.dart';
import 'package:cat_fact_application/data/services/cat_fact_service.dart';
import 'package:cat_fact_application/data/services/cat_image_service.dart';
import 'package:cat_fact_application/data/services/cat_storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  CatFactService catFactService = MockedCatFactService();

  CatImageService catImageService = CatImageServiceImpl();
  CatStorageService catStorageService = CatStorageServiceImpl();

  getIt.registerSingleton<CatFactService>(catFactService);
  getIt.registerSingleton<CatImageService>(catImageService);
  getIt.registerSingleton<Repository>(
    RepositoryImpl(
      catFactService: catFactService,
      catImagesService: catImageService,
      catStorageService: catStorageService,
    ),
  );
}
