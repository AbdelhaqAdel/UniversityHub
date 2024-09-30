import 'package:universityhup/features/instructor_role/grade/domain/entities/student_entity.dart';

class StudentModel extends StudentEntity{
 
  StudentModel({
    required super.studentId,
     required super.studentName,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
    studentId: json["studentId"],
    studentName: json["studentName"],
  );

  Map<String, dynamic> toJson() => {
    "studentId": studentId,
    "studentName": studentName,
  };
}
