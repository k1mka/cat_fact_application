import 'package:cat_fact_application/data/repository/repo.dart';
import 'package:cat_fact_application/get_it.dart';
import 'package:cat_fact_application/presentation/screens/home_screen/bloc/cat_bloc.dart';
import 'package:cat_fact_application/presentation/screens/home_screen/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatBloc>(
      create: (_) => CatBloc(getIt<Repository>()),
      child: const HomeLayout(),
    );
  }
}
