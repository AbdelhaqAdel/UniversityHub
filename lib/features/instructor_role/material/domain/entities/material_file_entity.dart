import 'package:hive/hive.dart';
part 'material_file_entity.g.dart';
@HiveType(typeId: 3)
class FileEntity{
  @HiveField(0)
  int lectureFileId;
  @HiveField(1)
  String fileName;
  @HiveField(2)
  String filePath;
  @HiveField(3)
  String createdAt;

  FileEntity({
   required this.fileName,
   required this.filePath,
   required this.createdAt,
   required this.lectureFileId
   });
}