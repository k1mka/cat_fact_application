import 'package:cat_fact_application/Data/models/cat_fact_and_photo.dart';
import 'package:cat_fact_application/Presentation/widgets/cat_fact_widget.dart';
import 'package:cat_fact_application/Presentation/widgets/cat_image_widget.dart';
import 'package:flutter/material.dart';

class CatPhotoFactWidget extends StatelessWidget {
  const CatPhotoFactWidget({
    Key? key,
    required this.catFactAndPhoto,
  }) : super(key: key);

  final CatFactAndPhoto catFactAndPhoto;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CatImageWidget(
              link: catFactAndPhoto.photoLink,
            ),
            CatFactWidget(
              fact: catFactAndPhoto.catFact.fact,
              date: catFactAndPhoto.catFact.creationDate,
            ),
          ],
        ),
      ),
    );
  }
}
