import 'package:flutter/material.dart';

class CatFactWidget extends StatelessWidget {
  final String fact;
  const CatFactWidget({Key? key, required this.fact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          fact,
          style: const TextStyle(
            fontSize: 20,
            // TODO: добавить красивый шрифт
          ),
        ),
      ),
    );
  }
}
