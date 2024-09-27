class AssignmentInstructorEntity {
  final String? taskId;
  final String? taskName;
  final int? taskGrade;
  final String? startDate;
  final String? endDate;
  final String? status;
  final String? courseName;
  final String? filePath;
  final String? instructorName;
  final String? createdAt;

  AssignmentInstructorEntity(
      {required this.taskId,
      required this.taskName,
      required this.taskGrade,
      required this.startDate,
      required this.endDate,
      required this.status,
      required this.courseName,
      required this.filePath,
      required this.instructorName,
      required this.createdAt});
}
