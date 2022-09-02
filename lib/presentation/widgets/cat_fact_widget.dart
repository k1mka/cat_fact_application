import 'package:flutter/material.dart';

class CatFactWidget extends StatelessWidget {
  final String fact;
  final DateTime date;
  const CatFactWidget({Key? key, required this.fact, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 200),
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  // TODO: format data with locale
                  'Fact created at $date',
                  style: const TextStyle(
                    fontSize: 20,
                    // TODO: добавить красивый шрифт
                  ),
                ),
                Text(
                  fact,
                  style: const TextStyle(
                    fontSize: 20,
                    // TODO: добавить красивый шрифт
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
