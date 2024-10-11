import 'package:hive/hive.dart';

part 'dashboard_entity.g.dart'; // This will be generated

@HiveType(typeId: 13)
class DashboardEntity {
  @HiveField(0)
  final List<DashboardQuiz>? quizzes;

  @HiveField(1)
  final List<DashboardTask>? tasks;

  DashboardEntity({
    required this.quizzes,
    required this.tasks,
  });
}

@HiveType(typeId: 14)
class DashboardQuiz {
  @HiveField(0)
  final String? title;

  @HiveField(1)
  final String? startDate;

  @HiveField(2)
  final String? endDate;

  @HiveField(3)
  final int? grade;

  @HiveField(4)
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
}

@HiveType(typeId: 15)
class DashboardTask {
  @HiveField(0)
  final String? title;

  @HiveField(1)
  final String? startDate;

  @HiveField(2)
  final String? endDate;

  @HiveField(3)
  final int? grade;

  @HiveField(4)
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
}
