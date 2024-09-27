import 'dart:io';

class UploadAssignmentInstructorInputModel {
  final String? taskName;
  final String? taskGrade;
  final String? startDate;
  final String? endDate;
  final List<File>? file;

  UploadAssignmentInstructorInputModel( {
    required this.taskName,
    required this.taskGrade,
    required this.startDate,
    required this.endDate,
    required this.file,
  });


}
