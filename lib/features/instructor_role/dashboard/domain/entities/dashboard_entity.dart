import 'package:hive/hive.dart';

part 'dashboard_entity.g.dart'; // This will be generated

@HiveType(typeId: 16)
class DashboardInstructorEntity {
  @HiveField(0)
  final String? type;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? instructorName;

  @HiveField(3)
  final int? grade;

  @HiveField(4)
  final DateTime? startDate;

  @HiveField(5)
  final DateTime? endDate;

  @HiveField(6)
  final int? studentSubmissionCount;

  DashboardInstructorEntity({
    required this.type,
    required this.name,
    required this.instructorName,
    required this.grade,
    required this.startDate,
    required this.endDate,
    required this.studentSubmissionCount,
  });
}
