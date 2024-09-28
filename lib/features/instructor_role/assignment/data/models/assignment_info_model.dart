import '../../domain/entities/assignment_info_entity.dart';

class AssignmentInstructorInfoModel extends AssignmentInstructorInfoEntity {
  AssignmentInstructorInfoModel(
      {required super.taskName,
      required super.taskGrade,
      required super.startDate,
      required super.endDate,
      required super.status,
      required super.filePath,
      required super.createdAt});

  factory AssignmentInstructorInfoModel.fromJson(Map<String, dynamic> json) =>
      AssignmentInstructorInfoModel(
          taskName: json['taskName'],
          taskGrade: json['taskGrade'],
          startDate: json['startDate'],
          endDate: json['endDate'],
          status: json['status'],
          filePath: json['filePath'],
          createdAt: json['createdAt']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['taskName'] = super.taskName;
    data['taskGrade'] = super.taskGrade;
    data['startDate'] = super.startDate;
    data['endDate'] = super.endDate;
    data['status'] = super.status;
    data['filePath'] = super.filePath;
    data['createdAt'] = super.createdAt;
    return data;
  }
}
