// part 'material_folder_entity.g.dart';

// @HiveType(typeId: 2)
class FolderEntity {
  // @HiveField(0)
  String? lectureId;
  //  @HiveField(1)
  String? lectureName;
  //  @HiveField(2)
  String? type;
  //  @HiveField(3)
  String? createdAt;


  FolderEntity(
     {
     required this.lectureId,
     required this.lectureName,
     required this.type,
     required this.createdAt,
    });
}

