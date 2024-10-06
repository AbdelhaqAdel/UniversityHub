import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 4)
class UserInstructorEntity {
  @HiveField(0)
  final String? fullName;
  @HiveField(1)
  final String? email;
  @HiveField(2)
  final String? phone;
  @HiveField(3)
  final String? imagePath;
  @HiveField(4)
  final String? facultyName;
  @HiveField(5)
  final String? universityName;

  UserInstructorEntity(
      {
      required this.fullName,
      required this.email,
      required this.phone,
      required this.imagePath,
      required this.facultyName,
      required this.universityName});
}
