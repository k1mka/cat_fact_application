import 'package:cat_fact_application/Data/repository/repo.dart';
import 'package:cat_fact_application/Data/repository/repo_impl.dart';
import 'package:cat_fact_application/Data/servises/cat_fact_service.dart';
import 'package:cat_fact_application/Data/servises/cat_image_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  CatFactService catFactService = CatFactServiceImpl();

  CatImageService catImageService = CatImageServiceImpl();

  getIt.registerSingleton<CatFactService>(catFactService);
  getIt.registerSingleton<CatImageService>(catImageService);
  getIt.registerSingleton<Repository>(RepositoryImpl(
    catFactService: catFactService,
    catImagesService: catImageService,
  ));
}
