class UpdateAssignmentInstructorInputModel {
  final String? taskId;
  final String? taskName;
  final String? taskGrade;
  final String? startDate;
  final String? endDate;

  UpdateAssignmentInstructorInputModel({
    required this.taskId,
    required this.taskName,
    required this.taskGrade,
    required this.startDate,
    required this.endDate,
  });

 Map<String,dynamic> toMap(){
    Map<String,dynamic> map={
      "taskName": taskName,
      "taskGrade": taskGrade,
      "startDate": startDate,
      "endDate": endDate
    };
    return map;
  }
}
