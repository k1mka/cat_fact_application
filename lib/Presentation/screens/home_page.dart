import 'package:cat_fact_application/Presentation/widgets/cat_fact_widget.dart';
import 'package:cat_fact_application/Presentation/widgets/cat_image_widget.dart';
import 'package:cat_fact_application/Presentation/widgets/my_history_button.dart';
import 'package:cat_fact_application/Presentation/widgets/random_content_button_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.pinkAccent.withOpacity(0.10),
        // TODO: Сделать красивый задний фон
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('myCatApp'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.all(44.0),
              ),
              Center(
                child: CatImageWidget(
                  //TODO: ДОБАВИТЬ КРАСИВУЮ РАМКУ
                  link:
                      'https://24tv.ua/resources/photos/news/800x800_DIR/202103/1564564_14906372.jpg?202103140113',
                ),
              ),
              SizedBox(
                height: 6,
              ),
              CatFactWidget(
                fact:
                    'cats is beutifule animals cats is beutifule animals cats is beutifule animals cats is beutifule animals '
                    'cats is beutifule animals cats is beutifule animals cats is beutifule animals cats is beutifule animals',
              ),
              RandomContentButtonWidget(),
              SizedBox(
                height: 8,
              ),
              MyHistoryButton(),
            ],
          ),
        ),
      ),
    );
  }
}
