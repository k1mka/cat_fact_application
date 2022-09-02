import 'package:cat_fact_application/Presentation/widgets/cat_error_widget.dart';
import 'package:cat_fact_application/Presentation/widgets/cat_photo_fact_widget.dart';
import 'package:cat_fact_application/Presentation/widgets/custom_button.dart';
import 'package:cat_fact_application/presentation/screens/bloc/cat_bloc.dart';
import 'package:cat_fact_application/presentation/screens/bloc/cat_events.dart';
import 'package:cat_fact_application/presentation/screens/bloc/cat_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  void initState() {
    super.initState();
    context.read<CatBloc>().add(LoadedContentEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Trivia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(44.0),
        child: Column(
          children: [
            Center(
              child: BlocBuilder<CatBloc, CatContentStates>(
                builder: (context, state) {
                  if (state is InitialState) {
                    return const Center(child: Text('expectation'));
                  } else if (state is ErrorCat) {
                    return const CatErrorWidget();
                  } else if (state is LoadingCat) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LoadedCat) {
                    return CatPhotoFactWidget(catFactAndPhoto: state.factCat);
                  } else {
                    throw Exception(
                        'unprocessed state $state in LayoutContent');
                  }
                },
              ),
            ),
            const Spacer(),
            CustomButton(
              color: Colors.blue,
              text: 'Another fact!',
              onPressed: () => context.read<CatBloc>().add(
                    LoadedContentEvent(),
                  ),
            ),
            const SizedBox(height: 8),
            CustomButton(
              color: Colors.green,
              text: 'Show history',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
