import 'package:cat_fact_application/presentation/screens/home_screen/home_page_screen.dart';
import 'package:flutter/material.dart';

// doc:
// moved app from main.dart, coz main function is more high-level entity.
// main function is the entry point of dart app, but CatTrivia is a entry point of Flutter app.
// So this entities are on different levels of abstraction.
// In the app class you are specifying app-level properties, like theme,
// list of screens, homepage, localization etc
class CatTriviaApp extends StatelessWidget {
  const CatTriviaApp({Key? key}) : super(key: key);

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
