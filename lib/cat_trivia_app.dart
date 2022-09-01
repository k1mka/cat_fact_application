import 'package:cat_fact_application/Presentation/screens/home_page_screen.dart';
import 'package:flutter/material.dart';

class CatTrivia extends StatefulWidget {
  const CatTrivia({Key? key}) : super(key: key);

  @override
  State<CatTrivia> createState() => _CatTriviaState();
}

class _CatTriviaState extends State<CatTrivia> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePageScreen(),
    );
  }
}
