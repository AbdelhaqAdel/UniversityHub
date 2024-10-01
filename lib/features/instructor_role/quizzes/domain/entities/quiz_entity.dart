class QuizInstructorEntity {
  final String? id;
  final String? title;
  final String? startDate;
  final String? endDate;
  final String? status;
  final int? numberOfAllStudents;
  final int? numberOfStudentsSolve;

  QuizInstructorEntity({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.numberOfAllStudents,
    required this.numberOfStudentsSolve,
    required this.status,
  });
}
