

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {


  UserModel({required super.userId, required super.fullName, required super.email, required super.phone, required super.imagePath, required super.academicId, required super.level, required super.departmentName, required super.facultyName, required super.universityName});


  factory UserModel.fromJson(Map<String, dynamic> json) =>UserModel(
    userId : json['userId'],
    fullName : json['fullName'],
    email : json['email'],
    phone : json['phone'],
    imagePath : json['imagePath']??'',
    academicId :json['academicId'],
    level : json['level'],
    departmentName : json['departmentName'],
    facultyName : json['facultyName'],
    universityName :json['universityName']
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['fullName'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['imagePath'] = imagePath;
    data['academicId'] = academicId;
    data['level'] = level;
    data['departmentName'] = departmentName;
    data['facultyName'] = facultyName;
    data['universityName'] = universityName;
    return data;
  }

}
