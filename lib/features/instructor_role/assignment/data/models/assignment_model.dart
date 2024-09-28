import '../../domain/entities/assignment_entity.dart';

class AssignmentInstructorModel extends AssignmentInstructorEntity {
  AssignmentInstructorModel(
      {required super.taskId,
      required super.taskName,
      required super.startDate,
      required super.endDate,
      required super.filePath,
      required super.numberOfAllStudents,
      required super.numberOfStudentsUploads});

  factory AssignmentInstructorModel.fromJson(Map<String, dynamic> json) =>
      AssignmentInstructorModel(
          taskId: json['taskId'],
          taskName: json['taskName'],
          startDate: json['startDate'],
          endDate: json['endDate'],
          filePath: json['filePath'],
          numberOfStudentsUploads: json['numberOfStudentsUploads'],
          numberOfAllStudents: json['numberOfAllStudents']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['taskId'] = super.taskId;
    data['taskName'] = super.taskName;
    data['startDate'] = super.startDate;
    data['endDate'] = super.endDate;
    data['filePath'] = super.filePath;
    data['numberOfStudentsUploads'] = super.numberOfStudentsUploads;
    data['numberOfAllStudents'] = super.numberOfAllStudents;
    return data;
  }
}
