import 'dart:io';

class AddAssignmentInputModel {
  final String? taskName;
  final String? taskGrade;
  final String? startDate;
  final String? endDate;
  final List<File>? file;

  AddAssignmentInputModel( {
    required this.taskName,
    required this.taskGrade,
    required this.startDate,
    required this.endDate,
    required this.file,
  });


}
