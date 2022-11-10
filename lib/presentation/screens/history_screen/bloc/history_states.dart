import 'package:cat_fact_application/data/models/cat_fact_and_photo.dart';

// doc:
// parent class of History bloc state.
// commonly, most of the screen could have following states:
// - initial
// - loading
// - loaded
// - error
// Of course, there could be much more.
abstract class HistoryContentStates {}

class InitialState extends HistoryContentStates {}

class LoadingHistory extends HistoryContentStates {}

class LoadedHistory extends HistoryContentStates {
  final List<CatFactAndPhoto> factCat;

  LoadedHistory({required this.factCat});
}

class ErrorHistory extends HistoryContentStates {
  final Object exception;

  ErrorHistory(this.exception);
}
