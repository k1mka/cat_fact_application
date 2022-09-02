// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_fact_and_photo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatFactAndPhotoAdapter extends TypeAdapter<CatFactAndPhoto> {
  @override
  final int typeId = 0;

  @override
  CatFactAndPhoto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatFactAndPhoto(
      fields[0] as String,
      fields[1] as Fact,
    );
  }

  @override
  void write(BinaryWriter writer, CatFactAndPhoto obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.photoLink)
      ..writeByte(1)
      ..write(obj.catFact);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatFactAndPhotoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
