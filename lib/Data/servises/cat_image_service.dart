import 'dart:convert';

import 'package:http/http.dart';

abstract class CatImageService {
  Future<String> fetchImages();
}

class CatImagesServiceImpl implements CatImageService {
  @override
  Future<String> fetchImages() async {
    final url = Uri.parse('https://cataas.com/cat?json=true');
    final response = await get(url);
    Map<String, dynamic> responseMapImages = json.decode(response.body);
    var result = 'cataas.com' + responseMapImages['url'];
    return result;
    // TODO: DIVIDE API URL TO STATIC VALUE
  }
}
