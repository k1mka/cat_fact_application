import 'package:flutter/material.dart';

class CatFactWidget extends StatelessWidget {
  final String fact;
  const CatFactWidget({Key? key, required this.fact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(44.0),
      child: Text(
        fact,
        style: const TextStyle(
          fontSize: 12,
          // TODO: добавить красивый шрифт
        ),
      ),
    );
  }
}
