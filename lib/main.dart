import 'package:cat_fact_application/get_it.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cat_trivia_app.dart';

// doc:
// separated main function and app class in different files
void main() async {
  // doc:
  // setting up service locator
  // https://jhonatantirado.wordpress.com/2012/04/24/dependency-inversion-service-locator-or-dependency-injection/
  setupServiceLocator();
  await Hive.initFlutter();
  runApp(const CatTriviaApp());
}
