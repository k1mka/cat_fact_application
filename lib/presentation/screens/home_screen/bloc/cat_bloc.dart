import 'package:cat_fact_application/data/models/cat_fact_and_photo.dart';
import 'package:cat_fact_application/data/repository/repo.dart';
import 'package:cat_fact_application/presentation/screens/home_screen/bloc/cat_events.dart';
import 'package:cat_fact_application/presentation/screens/home_screen/bloc/cat_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBloc extends Bloc<LoadedContentEvent, CatContentStates> {
  Repository repo;
  CatBloc(this.repo) : super(InitialState()) {
    on<LoadedContentEvent>((event, emit) async {
      emit(LoadingCat());
      try {
        final images = await repo.fetchImages();
        final fact = await repo.fetchFacts();

        final catFactAndPhoto = CatFactAndPhoto(
          images,
          fact,
        );
        await repo.saveCatFact(catFactAndPhoto);

        emit(LoadedCat(factCat: catFactAndPhoto));
      } catch (e) {
        emit(ErrorCat(e));
      }
    });
  }
}
