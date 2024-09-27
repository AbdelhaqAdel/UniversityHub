
import 'package:universityhup/features/student_role/quizzes/data/models/question_data_model.dart';

import '../../domain/entities/quiz_data_entity.dart';

class QuizDataModel extends QuizDataEntity{
  QuizDataModel(
      {required super.id,
       required super.title,
       required super.startDate,
       required super.endDate,
       required super.grade,
       required super.courseId,
       required super.instructorId,
       required super.createdAt,
       required super.questions});

  factory QuizDataModel.fromJson(Map<String, dynamic> json) {
    return QuizDataModel(
    id : json['id'],
    title : json['title'],
    startDate : json['startDate'],
    endDate : json['endDate'],
    grade : json['grade'],
    courseId : json['courseId'],
    instructorId : json['instructorId'],
    createdAt : json['createdAt'],
    questions: fillQuestions(json),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['grade'] = grade;
    data['courseId'] = courseId;
    data['instructorId'] = instructorId;
    data['createdAt'] = createdAt;
    if (questions != null) {
      data['questions'] =questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}


List<Questions>fillQuestions(json){
  List<Questions>questions=[];
 if (json['questions'] != null) {
      json['questions'].forEach((v) {
        questions.add(Questions.fromJson(v));
      });
    }
    return questions;
}