
import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repo.dart';
import '../data_sources/user_local_data_source.dart';
import '../data_sources/user_remote_data_source.dart';

class UserRepoImpl extends UserRepo{
 final UserRemoteDataSource userRemoteDataSource;
 final UserStudentLocalDataSource userStudentLocalDataSource;


 UserRepoImpl({required this.userStudentLocalDataSource,  required this.userRemoteDataSource,});

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    try{
      UserEntity? userEntity;
      userEntity = await userRemoteDataSource.getUser();
      userEntity ??= await userStudentLocalDataSource.getStudent();

      return right(userEntity!);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }


  
}