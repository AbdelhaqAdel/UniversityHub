

import 'package:universityhup/features/instructor_role/material/domain/entities/material_file_entity.dart';

class FileModel extends FileEntity{
  FileModel({
    required super.fileName,
    required super.filePath,
    required super.createdAt,
    required super.lectureFileId});

  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
    fileName : json['fileName'],
    filePath : json['filePath'],
    createdAt : json['createdAt'],
    lectureFileId:json['lectureFileId'],
   );
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fileName'] = fileName;
    data['filePath'] = filePath;
    data['createdAt'] = createdAt;
    data['lectureFileId']=lectureFileId;
    return data;
  }
}