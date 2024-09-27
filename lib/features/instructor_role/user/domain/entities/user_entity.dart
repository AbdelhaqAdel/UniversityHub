class UserInstructorEntity {
  final String? userId;
  final String? fullName;
  final String? email;
  final String? phone;
  final String? imagePath;
  final String? academicId;
  final int? level;
  final String? departmentName;
  final String? facultyName;
  final String? universityName;

  UserInstructorEntity(
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
