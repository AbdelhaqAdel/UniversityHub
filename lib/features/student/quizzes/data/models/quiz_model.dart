import 'package:universityhup/features/student/quizzes/domain/entities/quiz_entity.dart';

class QuizModel extends QuizEntity{
  QuizModel(
      { 
      required super.id,
      required super.title,
      required super.notes,
      required super.startDate,
      required super.endDate,
      required super.createdAt,
      required super.status,
      });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
    id : json['id'],
    title : json['title'],
    notes : json['notes'],
    startDate : json['startDate'],
    endDate : json['endDate'],
    createdAt : json['createdAt'],
    status : json['status'],
    );
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['notes'] = notes;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['createdAt'] = createdAt;
    data['status'] = status;
    return data;
  }
}
