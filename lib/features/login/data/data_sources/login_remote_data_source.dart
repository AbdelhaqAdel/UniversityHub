import '../../../../core/constants/constant.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/end_point.dart';
import '../../domain/entities/login_entity.dart';
import '../models/login_model.dart';

abstract class LoginRemoteDataSource{
 Future<LoginEntity>  login({required LoginDataModel loginDataModel});
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource{


  @override
  Future<LoginEntity> login({required LoginDataModel loginDataModel}) async{
    LoginEntity? loginEntity;
    await DioHelper.post(
        url: EndPoint.login, data: {
      'email': loginDataModel.email,
      'password': loginDataModel.password,
    }).then((value) async {
      loginEntity = LoginModel.fromJson(value.data);
      return loginEntity;
    });
    return loginEntity!;
  }

}

