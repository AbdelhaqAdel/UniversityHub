// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'material_folder_entity.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class FolderEntityAdapter extends TypeAdapter<FolderEntity> {
//   @override
//   final int typeId = 2;

//   @override
//   FolderEntity read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return FolderEntity(
//       lectureId: fields[0] as String?,
//       lectureName: fields[1] as String?,
//       type: fields[2] as String?,
//       createdAt: fields[4] as String?,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, FolderEntity obj) {
//     writer
//       ..writeByte(6)
//       ..writeByte(0)
//       ..write(obj.lectureId)
//       ..writeByte(1)
//       ..write(obj.lectureName)
//       ..writeByte(2)
//       ..write(obj.semesterName)
//       ..writeByte(3)
//       ..write(obj.type)
//       ..writeByte(4)
//       ..write(obj.createdAt)
//       ..writeByte(5)
//       ..write(obj.path);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is FolderEntityAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
