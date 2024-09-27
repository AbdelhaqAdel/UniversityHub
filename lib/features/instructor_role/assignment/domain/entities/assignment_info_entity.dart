class AssignmentInstructorInfoEntity {
  final String? taskName;
  final int? taskGrade;
  final String? startDate;
  final String? endDate;
  final String? status;
  final String? filePath;
  final String? createdAt;

  AssignmentInstructorInfoEntity(
      {required this.taskName,
      required this.taskGrade,
      required this.startDate,
      required this.endDate,
      required this.status,
      required this.filePath,
      required this.createdAt});
}
