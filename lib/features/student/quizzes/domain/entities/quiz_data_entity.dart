import 'package:universityhup/features/student/quizzes/data/models/question_data_model.dart';

class QuizDataEntity {
  String? id;
  String? title;
  String? startDate;
  String? endDate;
  int? grade;
  String? courseId;
  String? instructorId;
  String? createdAt;
  List<Questions>? questions;

  QuizDataEntity(
      { 
      required this.id,
      required this.title,
      required this.startDate,
      required this.endDate,
      required this.grade,
      required this.courseId,
      required this.instructorId,
      required this.createdAt,
      required this.questions,
      });
}