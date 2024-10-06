import 'package:hive/hive.dart';
import '../../../../../core/constants/hive_constants.dart';
import '../../domain/entities/user_entity.dart';


abstract class UserInstructorLocalDataSource {
  Future<UserInstructorEntity?> getUserInstructor();
}

class UserInstructorLocalDataSourceImpl extends UserInstructorLocalDataSource {
  @override
  Future<UserInstructorEntity?> getUserInstructor() async {
    UserInstructorEntity? userEntity;
    var box = Hive.box<UserInstructorEntity>(HiveConstants.kUserInstructorBox);
    userEntity = box.get('user');
    return userEntity;
  }



}
