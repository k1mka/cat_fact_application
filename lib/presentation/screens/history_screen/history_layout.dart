import 'package:cat_fact_application/presentation/widgets/cat_error_widget.dart';
import 'package:cat_fact_application/presentation/widgets/cat_photo_fact_widget.dart';
import 'package:cat_fact_application/presentation/screens/history_screen/bloc/history_bloc.dart';
import 'package:cat_fact_application/presentation/screens/history_screen/bloc/history_events.dart';
import 'package:cat_fact_application/presentation/screens/history_screen/bloc/history_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// doc:
// layout is widget, that responsible for screen UI.
// It should not configure all screen view,
// but manipulate the smaller widget depending of state of a screen.
class HistoryLayout extends StatefulWidget {
  const HistoryLayout({Key? key}) : super(key: key);

  @override
  State<HistoryLayout> createState() => _HistoryLayoutState();
}

class _HistoryLayoutState extends State<HistoryLayout> {
  // doc:
  // passing initial event in initState method override,
  // so our BLoc will start fetching data when screen is shown.
  @override
  void initState() {
    BlocProvider.of<HistoryBloc>(context).add(LoadHistoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: BlocBuilder<HistoryBloc, HistoryContentStates>(
        builder: (context, state) {
          if (state is InitialState) {
            return const Center(child: Text('expectation'));
          } else if (state is ErrorHistory) {
            return const CatErrorWidget();
          } else if (state is LoadingHistory) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedHistory) {
            return ListView.builder(
              itemCount: state.factCat.length,
              itemBuilder: (context, i) => CatPhotoFactWidget(
                catFactAndPhoto: state.factCat[i],
              ),
            );
          } else {
            throw Exception('unprocessed state $state in LayoutContent');
          }
        },
      ),
    );
  }
}
