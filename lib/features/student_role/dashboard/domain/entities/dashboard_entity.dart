class DashboardEntity {
  final List<DashboardQuiz>? quizzes;
  final List<DashboardTask>? tasks;

  DashboardEntity({
    required this.quizzes,
    required this.tasks,
  });


}

class DashboardQuiz {
  final String? title;
  final String? startDate;
  final String? endDate;
  final int? grade;
  final String? createdAt;
  DashboardQuiz({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.grade,
    required this.createdAt,
  });

  factory DashboardQuiz.fromJson(Map<String, dynamic> json) => DashboardQuiz(
        title: json["title"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        grade: json["grade"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "startDate": startDate,
        "endDate": endDate,
        "grade": grade,
        "createdAt": createdAt,
      };
}

class DashboardTask {
final  String? title;
final  String? startDate;
final  String? endDate;
final int? grade;
final String? createdAt;

  DashboardTask({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.grade,
    required this.createdAt,
  });

  factory DashboardTask.fromJson(Map<String, dynamic> json) => DashboardTask(
        title: json["title"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        grade: json["grade"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "startDate": startDate,
        "endDate": endDate,
        "grade": grade,
        "createdAt": createdAt,
      };
}
