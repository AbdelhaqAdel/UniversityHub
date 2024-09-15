// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_file_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FileEntityAdapter extends TypeAdapter<FileEntity> {
  @override
  final int typeId = 3;

  @override
  FileEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FileEntity(
      fileName: fields[1] as String,
      filePath: fields[2] as String,
      createdAt: fields[3] as String,
      lectureFileId: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FileEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.lectureFileId)
      ..writeByte(1)
      ..write(obj.fileName)
      ..writeByte(2)
      ..write(obj.filePath)
      ..writeByte(3)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
