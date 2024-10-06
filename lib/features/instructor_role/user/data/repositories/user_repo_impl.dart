
import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repo.dart';
import '../data_sources/user_local_data_source.dart';
import '../data_sources/user_remote_data_source.dart';

class UserInstructorRepoImpl extends UserInstructorRepo{
 final UserInstructorRemoteDataSource userRemoteDataSource;
 final UserInstructorLocalDataSource userInstructorLocalDataSource;


 UserInstructorRepoImpl(  {required this.userRemoteDataSource,required this.userInstructorLocalDataSource,});

  @override
  Future<Either<Failure, UserInstructorEntity>> getUserInstructor() async {
    try{
      UserInstructorEntity? userEntity;
      userEntity = await userRemoteDataSource.getUserInstructor();
      userEntity ??= await userInstructorLocalDataSource.getUserInstructor();
       return right(userEntity!);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }


  
}