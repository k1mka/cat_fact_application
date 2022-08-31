import 'package:flutter/material.dart';

class MyHistoryButton extends StatelessWidget {
  const MyHistoryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 332.0,
      height: 54.0,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(12.0),
          primary: Colors.blue,
        ),
        child: const Text(
          'My history!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
