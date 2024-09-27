
import '../../domain/entities/grade_entity.dart';

class GradeModel extends GradeEntity {
  GradeModel(
      {required super.title, required super.studentGrade, required super.fullGrade, required super.date});

  factory GradeModel.fromJson(Map<String, dynamic> json)=> GradeModel(
    title : json['title'],
    studentGrade : json['studentGrade'],
    fullGrade : json['fullGrade'],
    date : json['date'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = super.title;
    data['studentGrade'] = super.studentGrade;
    data['fullGrade'] = super.fullGrade;
    data['date'] = super.date;
    return data;
  }
}
