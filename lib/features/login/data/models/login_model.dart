
import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel( {super.email, required super.displayName, required super.token, required super.userRole,});
  factory LoginModel.fromJson(Map<String?, dynamic>?json)=> LoginModel(
    email : json?['email'],
    displayName: json?['displayName'],
    token: json?['token'],
    userRole: json?['userRole'],
  );

  Map<String, dynamic> toMap() {
    return {
      'email': super.email,
      'displayName': super.displayName,
      'token': super.token,
      'userRole': super.userRole,

    };
  }

}

class LoginDataModel {
  String? email;
  String? password;

  LoginDataModel({
    this.email,
    this.password,
  });
}

