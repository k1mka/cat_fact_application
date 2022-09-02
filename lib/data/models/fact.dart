import 'package:hive/hive.dart';
part 'fact.g.dart';

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
