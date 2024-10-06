import 'package:hive/hive.dart';

part 'login_entity.g.dart';

@HiveType(typeId: 6)
class LoginEntity {
  @HiveField(0)
  String? displayName;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? token;
  @HiveField(3)
  String? userRole;

  LoginEntity(
      {required this.displayName,
      required this.email,
      required this.token,
      required this.userRole});
}
