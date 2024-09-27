import '../../domain/entities/user_entity.dart';

class UserInstructorModel extends UserInstructorEntity {
  UserInstructorModel(
      {required super.fullName,
      required super.email,
      required super.phone,
      required super.imagePath,
      required super.facultyName,
      required super.universityName});

  factory UserInstructorModel.fromJson(Map<String, dynamic> json) =>
      UserInstructorModel(
          fullName: json['fullName'],
          email: json['email'],
          phone: json['phone'],
          imagePath: json['imagePath'] ?? '',
          facultyName: json['facultyName'],
          universityName: json['universityName']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['imagePath'] = imagePath;
    data['facultyName'] = facultyName;
    data['universityName'] = universityName;
    return data;
  }
}
