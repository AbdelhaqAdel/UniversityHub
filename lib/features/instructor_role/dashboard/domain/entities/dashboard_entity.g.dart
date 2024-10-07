// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DashboardInstructorEntityAdapter
    extends TypeAdapter<DashboardInstructorEntity> {
  @override
  final int typeId = 16;

  @override
  DashboardInstructorEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DashboardInstructorEntity(
      type: fields[0] as String?,
      name: fields[1] as String?,
      instructorName: fields[2] as String?,
      grade: fields[3] as int?,
      startDate: fields[4] as DateTime?,
      endDate: fields[5] as DateTime?,
      studentSubmissionCount: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, DashboardInstructorEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.instructorName)
      ..writeByte(3)
      ..write(obj.grade)
      ..writeByte(4)
      ..write(obj.startDate)
      ..writeByte(5)
      ..write(obj.endDate)
      ..writeByte(6)
      ..write(obj.studentSubmissionCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DashboardInstructorEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
