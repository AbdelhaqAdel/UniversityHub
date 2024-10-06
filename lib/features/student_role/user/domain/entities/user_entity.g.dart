// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  final int typeId = 5;

  @override
  UserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntity(
      userId: fields[0] as String?,
      fullName: fields[1] as String?,
      email: fields[2] as String?,
      phone: fields[3] as String?,
      imagePath: fields[4] as String?,
      academicId: fields[5] as String?,
      level: fields[6] as int?,
      departmentName: fields[7] as String?,
      facultyName: fields[8] as String?,
      universityName: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.imagePath)
      ..writeByte(5)
      ..write(obj.academicId)
      ..writeByte(6)
      ..write(obj.level)
      ..writeByte(7)
      ..write(obj.departmentName)
      ..writeByte(8)
      ..write(obj.facultyName)
      ..writeByte(9)
      ..write(obj.universityName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
