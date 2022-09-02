import 'package:cat_fact_application/get_it.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cat_trivia_app.dart';

void main() async {
  setupServiceLocator();
  await Hive.initFlutter();
  runApp(const CatTrivia());
}
