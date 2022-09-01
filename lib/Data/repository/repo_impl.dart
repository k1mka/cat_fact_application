import 'package:cat_fact_application/Data/repository/repo.dart';
import 'package:cat_fact_application/Data/servises/cat_image_service.dart';

class RepositoryImpl extends Repository {
  final CatImagesServiceImpl catImagesServiceImpl;

  RepositoryImpl(this.catImagesServiceImpl);
  @override
  Future<String> fetchImages() async {
    final images = await catImagesServiceImpl.fetchImages();
    return images;
  }
}
