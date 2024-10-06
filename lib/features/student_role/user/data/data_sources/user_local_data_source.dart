import 'package:hive/hive.dart';
import 'package:universityhup/features/student_role/user/domain/entities/user_entity.dart';
import '../../../../../core/constants/hive_constants.dart';


abstract class UserStudentLocalDataSource {
  Future<UserEntity?> getStudent();
}

class UserStudentLocalDataSourceImpl extends UserStudentLocalDataSource {
  @override
  Future<UserEntity?> getStudent() async {
    UserEntity? userEntity;
    var box = Hive.box<UserEntity>(HiveConstants.kUserStudentBox);
    userEntity = box.get('user');
    return userEntity;
  }



}
