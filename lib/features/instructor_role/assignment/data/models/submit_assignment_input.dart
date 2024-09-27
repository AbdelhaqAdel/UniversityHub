import 'dart:io';

class SubmitAssignmentInstructorInputModel {
  final String? taskId;
  final List<File> file;

  SubmitAssignmentInstructorInputModel({required this.taskId, required this.file});
}