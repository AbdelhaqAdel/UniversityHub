
import 'package:universityhup/features/instructor_role/dashboard/domain/entities/dashboard_entity.dart';

class DashboardInstructorModel extends DashboardInstructorEntity {
  DashboardInstructorModel({required super.type, required super.name, required super.instructorName, required super.grade, required super.startDate, required super.endDate, required super.studentSubmissionCount});


  factory DashboardInstructorModel.fromJson(Map<String, dynamic> json) => DashboardInstructorModel(
    type: json["type"],
    name: json["name"],
    instructorName:json["instructorName"],
    grade: json["grade"],
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    studentSubmissionCount: json["studentSubmissionCount"],
  );

  Map<String, dynamic> toJson() => {
    "type":type,
    "name": name,
    "instructorName":instructorName,
    "grade": grade,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "studentSubmissionCount": studentSubmissionCount,
  };

}
