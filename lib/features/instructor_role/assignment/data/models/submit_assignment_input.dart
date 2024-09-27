import 'dart:io';

class SubmitAssignmentInputModel {
  final String? taskId;
  final List<File> file;

  SubmitAssignmentInputModel({required this.taskId, required this.file});
}