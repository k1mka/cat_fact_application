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
        child: PhysicalModel(
          elevation: 8,
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              link,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
