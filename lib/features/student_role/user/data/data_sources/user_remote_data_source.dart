
import '../../../../../core/constants/constant.dart';
import '../../../../../core/utils/api_service.dart';
import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';


abstract class UserRemoteDataSource {
  Future<UserEntity?> getUser();
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  @override
  Future<UserEntity?> getUser() async {
    UserEntity? userEntity;
    await DioHelper.get(
      url: 'https://lms.runasp.net/api/Students/GetStudentInfo',
      token: token,
    ).then((value) async {
      if (value.statusCode == 200) {
        var json = value.data;
        userEntity= UserModel.fromJson(json);
      }
    });
    return userEntity;
  }



}
