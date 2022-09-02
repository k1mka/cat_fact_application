import 'package:cat_fact_application/Data/repository/repo.dart';
import 'package:cat_fact_application/get_it.dart';
import 'package:cat_fact_application/presentation/screens/history_screen/bloc/history_bloc.dart';
import 'package:cat_fact_application/presentation/screens/history_screen/history_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryBloc>(
      create: (context) => HistoryBloc(getIt<Repository>()),
      child: const HistoryLayout(),
    );
  }
}
