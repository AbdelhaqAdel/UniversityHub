
import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repo.dart';
import '../data_sources/user_remote_data_source.dart';

class UserRepoImpl extends UserRepo{
 final UserRemoteDataSource userRemoteDataSource;


 UserRepoImpl( {required this.userRemoteDataSource,});

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    try{
      UserEntity? userEntity;
      userEntity = await userRemoteDataSource.getUser();
       return right(userEntity!);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }


  
}