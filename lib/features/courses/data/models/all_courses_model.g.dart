// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_courses_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoursesModelAdapter extends TypeAdapter<CoursesModel> {
  @override
  final int typeId = 0;

  @override
  CoursesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoursesModel(
      hiveIndex: fields[0] as int?,
      cycleId: fields[1] as String,
      name: fields[2] as String,
      hours: fields[3] as int,
      imagePath: fields[4] as String,
      instructorFullName: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CoursesModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.hiveIndex)
      ..writeByte(1)
      ..write(obj.cycleId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.hours)
      ..writeByte(4)
      ..write(obj.imagePath)
      ..writeByte(5)
      ..write(obj.instructorFullName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoursesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
