import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 5)
class UserEntity {
  @HiveField(0)
  final String? userId;
  @HiveField(1)
  final String? fullName;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final String? phone;
  @HiveField(4)
  final String? imagePath;
  @HiveField(5)
  final String? academicId;
  @HiveField(6)
  final int? level;
  @HiveField(7)
  final String? departmentName;
  @HiveField(8)
  final String? facultyName;
  @HiveField(9)
  final String? universityName;

  UserEntity(
      {required this.userId,
      required this.fullName,
      required this.email,
      required this.phone,
      required this.imagePath,
      required this.academicId,
      required this.level,
      required this.departmentName,
      required this.facultyName,
      required this.universityName});
}
