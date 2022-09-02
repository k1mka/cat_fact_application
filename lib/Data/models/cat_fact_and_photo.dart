import 'package:cat_fact_application/Data/models/fact.dart';
import 'package:hive/hive.dart';

part 'cat_fact_and_photo.g.dart';

@HiveType(typeId: 0)
class CatFactAndPhoto {
  @HiveField(0)
  final String photoLink;
  @HiveField(1)
  final Fact catFact;

  const CatFactAndPhoto(this.photoLink, this.catFact);

  @override
  String toString() {
    return 'CatFactAndPhoto{photoLink: $photoLink, catFact: $catFact}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatFactAndPhoto &&
          runtimeType == other.runtimeType &&
          photoLink == other.photoLink &&
          catFact == other.catFact;

  @override
  int get hashCode => photoLink.hashCode ^ catFact.hashCode;
}
