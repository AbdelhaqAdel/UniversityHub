class AssignmentInstructorEntity {
  final String? taskId;
  final String? taskName;
  final String? startDate;
  final String? endDate;
  final String? filePath;
  final int? numberOfAllStudents;
  final int? numberOfStudentsUploads;

  AssignmentInstructorEntity(
      {required this.taskId,
      required this.taskName,
      required this.startDate,
      required this.endDate,
      required this.numberOfAllStudents,
      required this.numberOfStudentsUploads,
      required this.filePath,
   });
}
