import 'package:flutter/material.dart';

class CatErrorWidget extends StatelessWidget {
  static const String errorText = 'Ошибка загрузки котов';
  static const double sizeClose = 50.0;

  const CatErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.close,
            size: sizeClose,
            color: Colors.red,
          ),
          Text(
            errorText,
            style: TextStyle(color: Colors.red, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
