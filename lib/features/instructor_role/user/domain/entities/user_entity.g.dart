// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInstructorEntityAdapter extends TypeAdapter<UserInstructorEntity> {
  @override
  final int typeId = 4;

  @override
  UserInstructorEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInstructorEntity(
      fullName: fields[0] as String?,
      email: fields[1] as String?,
      phone: fields[2] as String?,
      imagePath: fields[3] as String?,
      facultyName: fields[4] as String?,
      universityName: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserInstructorEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.fullName)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.imagePath)
      ..writeByte(4)
      ..write(obj.facultyName)
      ..writeByte(5)
      ..write(obj.universityName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInstructorEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
