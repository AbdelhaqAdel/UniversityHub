import '../../domain/entities/assignment_entity.dart';

class AssignmentInstructorModel extends AssignmentInstructorEntity {
  AssignmentInstructorModel(
      {required super.taskId,
      required super.taskName,
      required super.taskGrade,
      required super.startDate,
      required super.endDate,
      required super.status,
      required super.courseName,
      required super.filePath,
      required super.instructorName,
      required super.createdAt});

  factory AssignmentInstructorModel.fromJson(Map<String, dynamic> json) =>
      AssignmentInstructorModel(
          taskId: json['taskId'],
          taskName: json['taskName'],
          taskGrade: json['taskGrade'],
          startDate: json['startDate'],
          endDate: json['endDate'],
          status: json['status'],
          courseName: json['courseName'],
          filePath: json['filePath'],
          instructorName: json['instructorName'],
          createdAt: json['createdAt']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['taskId'] = super.taskId;
    data['taskName'] = super.taskName;
    data['taskGrade'] = super.taskGrade;
    data['startDate'] = super.startDate;
    data['endDate'] = super.endDate;
    data['status'] = super.status;
    data['courseName'] = super.courseName;
    data['filePath'] = super.filePath;
    data['instructorName'] = super.instructorName;
    data['createdAt'] = super.createdAt;
    return data;
  }
}
