import 'package:cat_fact_application/data/repository/repo.dart';
import 'package:cat_fact_application/presentation/screens/history_screen/bloc/history_events.dart';
import 'package:cat_fact_application/presentation/screens/history_screen/bloc/history_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// doc:
// Our BLoC class.
// https://www.mitrais.com/news-updates/getting-started-with-flutter-bloc-pattern/#:~:text=Bloc%20is%20a%20design%20pattern,and%20maintained%20by%20Felix%20Angelo.
// https://pub.dev/packages/flutter_bloc
class HistoryBloc extends Bloc<HistoryEvent, HistoryContentStates> {
  final Repository repo;

  HistoryBloc(this.repo) : super(InitialState()) {
    on<LoadHistoryEvent>((event, emit) async {
      emit(LoadingHistory());
      try {
        final facts = await repo.getShownCatFact();

        emit(LoadedHistory(factCat: facts));
      } catch (e) {
        emit(ErrorHistory(e));
      }
    });
  }
}
