// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsEntityAdapter extends TypeAdapter<NewsEntity> {
  @override
  final int typeId = 12;

  @override
  NewsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsEntity(
      newsId: fields[0] as String?,
      content: fields[1] as String?,
      filePath: fields[2] as String?,
      facultyId: fields[3] as String?,
      createdAt: fields[4] as String?,
      userId: fields[5] as String?,
      userName: fields[6] as String?,
      userImage: fields[7] as String?,
      facultyName: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NewsEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.newsId)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.filePath)
      ..writeByte(3)
      ..write(obj.facultyId)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.userId)
      ..writeByte(6)
      ..write(obj.userName)
      ..writeByte(7)
      ..write(obj.userImage)
      ..writeByte(8)
      ..write(obj.facultyName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
