import '../../domain/entities/student_task_uploaded_entity.dart';

class StudentTaskUploadedModel extends StudentTaskUploadedEntity {
  StudentTaskUploadedModel(
      {required super.studentId,
      required super.studentName,
      required super.filePath,
      required super.timeUploaded});


 factory StudentTaskUploadedModel.fromJson(Map<String, dynamic> json) =>
      StudentTaskUploadedModel(
          studentId: json['studentId'],
          studentName: json['studentName'],
          filePath: json['filePath'],
          timeUploaded: json['timeUploaded'],
    );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['studentId'] = studentId;
    data['studentName'] = studentName;
    data['filePath'] = filePath;
    data['timeUploaded'] = timeUploaded;
    return data;
  }
}
