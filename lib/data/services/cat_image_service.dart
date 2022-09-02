import 'dart:convert';

import 'package:http/http.dart';

abstract class CatImageService {
  Future<String> fetchImages();
}

class CatImageServiceImpl implements CatImageService {
  static const _scheme = 'https://';
  static const _catDomain = 'cataas.com';
  static const _randomPhotoEndpoint = '/cat?json=true';

  static const _catServiceUrl = '$_scheme$_catDomain';

  static const _randomCatPhotoUrl = '$_catServiceUrl$_randomPhotoEndpoint';

  @override
  Future<String> fetchImages() async {
    final url = Uri.parse(_randomCatPhotoUrl);
    final response = await get(url);
    Map<String, dynamic> responseMapImages = json.decode(response.body);
    final result = '$_catServiceUrl${responseMapImages['url']}';
    return result;
  }
}
