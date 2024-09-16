import 'package:hive/hive.dart';
part 'material_folder_entity.g.dart';

@HiveType(typeId: 2)
class FolderEntity {
  @HiveField(0)
  String? lectureId;
   @HiveField(1)
  String? lectureName;
 @HiveField(2)
  String? semesterName;
   @HiveField(3)
  String? type;
   @HiveField(4)
  String? createdAt;
   @HiveField(5)
  String? path;

  FolderEntity(
     {
     required this.lectureId,
     required this.lectureName,
     required this.semesterName,
     required this.type,
     required this.createdAt,
     required this.path,
    });
}

