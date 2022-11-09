import 'package:hive/hive.dart';
part 'fact.g.dart';

// doc:
// DTO that contains fact and date of its creation. (https://stackoverflow.com/questions/1051182/what-is-a-data-transfer-object-dto)
// It is annotated with Hive in order to help hive to store it.
@HiveType(typeId: 1)
class Fact {
  @HiveField(0)
  final String fact;
  @HiveField(1)
  final DateTime creationDate;

  const Fact(this.fact, this.creationDate);

  @override
  String toString() {
    return 'Fact{fact: $fact, creationDate: $creationDate}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Fact &&
          runtimeType == other.runtimeType &&
          fact == other.fact &&
          creationDate == other.creationDate;

  @override
  int get hashCode => fact.hashCode ^ creationDate.hashCode;
}
