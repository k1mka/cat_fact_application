import 'package:cat_fact_application/Business%20logic/cat_events.dart';
import 'package:cat_fact_application/Business%20logic/cat_states.dart';
import 'package:cat_fact_application/Data/models/cat_fact_and_photo.dart';
import 'package:cat_fact_application/Data/repository/repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBloc extends Bloc<LoadedContentEvent, CatContentStates> {
  Repository repo;
  CatBloc(this.repo) : super(InitialState()) {
    on<LoadedContentEvent>((event, emit) async {
      emit(LoadingCat());
      try {
        final images = await repo.fetchImages();
        final fact = await repo.fetchFacts();

        emit(
          LoadedCat(
            factCat: CatFactAndPhoto(
              images,
              fact,
            ),
          ),
        );
      } catch (e) {
        emit(ErrorCat(e));
      }
    });
  }
}
