import 'package:flutter/material.dart';

// doc:
// creation of reusable components improves code readability and makes it more flexible.
// this is not best-written widget, but still it is better then copy/paste,
// so u always need to aim for small reusable widgets.
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.color,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(12.0),
            primary: color,
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
