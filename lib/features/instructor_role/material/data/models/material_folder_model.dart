import 'package:universityhup/features/instructor_role/material/domain/entities/material_folder_entity.dart';

class FolderModel extends FolderEntity{
  FolderModel(
      {
       required super.lectureId,
       required super.lectureName,
       required super.type,
       required super.createdAt,
      });

  factory FolderModel.fromJson(Map<String, dynamic> json) {
    return FolderModel(
    lectureId:json['LectureId'],
    lectureName : json['LectureName'],
    type : json['Type'],
    createdAt : json['CreatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LectureId']=lectureId;
    data['LectureName'] = lectureName;
    data['Type'] = type;
    data['CreatedAt'] = createdAt;
    return data;
  }
}

