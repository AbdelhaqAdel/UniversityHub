// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DashboardEntityAdapter extends TypeAdapter<DashboardEntity> {
  @override
  final int typeId = 13;

  @override
  DashboardEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DashboardEntity(
      quizzes: (fields[0] as List?)?.cast<DashboardQuiz>(),
      tasks: (fields[1] as List?)?.cast<DashboardTask>(),
    );
  }

  @override
  void write(BinaryWriter writer, DashboardEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.quizzes)
      ..writeByte(1)
      ..write(obj.tasks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DashboardEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DashboardQuizAdapter extends TypeAdapter<DashboardQuiz> {
  @override
  final int typeId = 14;

  @override
  DashboardQuiz read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DashboardQuiz(
      title: fields[0] as String?,
      startDate: fields[1] as String?,
      endDate: fields[2] as String?,
      grade: fields[3] as int?,
      createdAt: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DashboardQuiz obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.startDate)
      ..writeByte(2)
      ..write(obj.endDate)
      ..writeByte(3)
      ..write(obj.grade)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DashboardQuizAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DashboardTaskAdapter extends TypeAdapter<DashboardTask> {
  @override
  final int typeId = 15;

  @override
  DashboardTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DashboardTask(
      title: fields[0] as String?,
      startDate: fields[1] as String?,
      endDate: fields[2] as String?,
      grade: fields[3] as int?,
      createdAt: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DashboardTask obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.startDate)
      ..writeByte(2)
      ..write(obj.endDate)
      ..writeByte(3)
      ..write(obj.grade)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DashboardTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
