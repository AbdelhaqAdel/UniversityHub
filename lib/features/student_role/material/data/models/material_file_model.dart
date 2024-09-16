
import '../../domain/entities/material_file_entity.dart';

class FileModel extends FileEntity{
  FileModel({
    required super.fileName,
    required super.filePath,
    required super.createdAt,
    required super.lectureFileId});

  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
    fileName : json['fileName'],
    filePath : json['FilePath'],
    createdAt : json['CreatedAt'],
    lectureFileId:json['LectureFileId'],
   );
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fileName'] = fileName;
    data['FilePath'] = filePath;
    data['CreatedAt'] = createdAt;
    data['LectureFileId']=lectureFileId;
    return data;
  }
}