import 'package:cat_fact_application/data/models/cat_fact_and_photo.dart';

abstract class CatContentStates {}

class InitialState extends CatContentStates {}

class LoadingCat extends CatContentStates {}

class LoadedCat extends CatContentStates {
  final CatFactAndPhoto factCat;

  LoadedCat({required this.factCat});
}

class ErrorCat extends CatContentStates {
  final Object exception;

  ErrorCat(this.exception);
}
