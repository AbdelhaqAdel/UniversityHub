import '../../domain/entities/dashboard_entity.dart';

class DashboardModel extends DashboardEntity {
  DashboardModel({required super.quizzes, required super.tasks});


  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      DashboardModel(
        quizzes: json["quizzes"] == null
            ? []
            : List<DashboardQuiz>.from(json["quizzes"]!.map((x) => DashboardQuiz.fromJson(x))),
        tasks: json["tasks"] == null
            ? []
            : List<DashboardTask>.from(json["tasks"]!.map((x) => DashboardTask.fromJson(x))),
      );

}
