import 'package:flutter/material.dart';

class CatImageWidget extends StatelessWidget {
  final String link;
  const CatImageWidget({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: Image.network(
          link,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
