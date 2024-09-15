import 'package:universityhup/features/student/material/domain/entities/material_folder_entity.dart';

class FolderModel extends FolderEntity{
  FolderModel(
      {
       required super.lectureId,
       required super.lectureName,
       required super.semesterName,
       required super.type,
       required super.createdAt,
       required super.path,
      });

  factory FolderModel.fromJson(Map<String, dynamic> json) {
    return FolderModel(
    lectureId:json['lectureId'],
    lectureName : json['lectureName'],
    semesterName : json['semesterName'],
    type : json['type'],
    createdAt : json['createdAt'],
    path : json['path'],
    );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lectureId']=lectureId;
    data['lectureName'] = lectureName;
    data['semesterName'] = semesterName;
    data['type'] = type;
    data['createdAt'] = createdAt;
    data['path'] = path;
    return data;
  }
}

