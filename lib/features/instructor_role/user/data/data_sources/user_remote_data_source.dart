
import '../../../../../core/constants/constant.dart';
import '../../../../../core/utils/api_service.dart';
import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';


abstract class UserInstructorRemoteDataSource {
  Future<UserInstructorEntity?> getUserInstructor();
}

class UserInstructorRemoteDataSourceImpl extends UserInstructorRemoteDataSource {
  @override
  Future<UserInstructorEntity?> getUserInstructor() async {
    UserInstructorEntity? userEntity;
    await DioHelper.get(
      url: 'https://lms.runasp.net/api/Instructor/GetInstructorInfo',
      token: token,
    ).then((value) async {
      if (value.statusCode == 200) {
        var json = value.data;
        userEntity= UserInstructorModel.fromJson(json);
      }
    });
    return userEntity;
  }



}