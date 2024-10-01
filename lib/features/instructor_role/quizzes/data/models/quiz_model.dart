import '../../domain/entities/quiz_entity.dart';

class QuizInstructorModel extends QuizInstructorEntity {
  QuizInstructorModel(
      {required super.id,
      required super.title,
      required super.startDate,
      required super.endDate,
      required super.numberOfAllStudents,
      required super.numberOfStudentsSolve,
      required super.status});

  factory QuizInstructorModel.fromJson(Map<String, dynamic> json) =>
      QuizInstructorModel(
          id: json['id'],
          title: json['title'],
          startDate: json['startDate'],
          endDate: json['endDate'],
          status: json['status'],
          numberOfStudentsSolve: json['numberOfStudentsSolve'],
          numberOfAllStudents: json['numberOfAllStudents']);

}
