import 'package:cat_fact_application/get_it.dart';
import 'package:flutter/material.dart';

import 'cat_trivia_app.dart';

void main() {
  setupServiceLocator();
  runApp(const CatTrivia());
}
