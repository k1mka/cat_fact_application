import 'package:cat_fact_application/data/repository/repo.dart';
import 'package:cat_fact_application/presentation/screens/history_screen/bloc/history_events.dart';
import 'package:cat_fact_application/presentation/screens/history_screen/bloc/history_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryContentStates> {
  Repository repo;
  HistoryBloc(this.repo) : super(InitialState()) {
    on<LoadedHistoryEvent>((event, emit) async {
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
