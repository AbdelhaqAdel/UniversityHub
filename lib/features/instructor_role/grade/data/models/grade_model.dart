import '../../domain/entities/grade_entity.dart';

class InsGradeModel extends InsGradeEntity {
  InsGradeModel(
      {required super.id, required super.title, required super.grade, required super.date});

  factory InsGradeModel.fromJson(Map<String, dynamic> json)=> InsGradeModel(
    id : json['id'],
    title : json['title']??"",
    grade : json['grade']??0,
    date : json['date'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = super.id;
    data['title'] = super.title;
    data['grade'] = super.grade;
    data['date'] = super.date;
    return data;
  }
}
