
import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repo.dart';
import '../data_sources/user_remote_data_source.dart';

class UserInstructorRepoImpl extends UserInstructorRepo{
 final UserInstructorRemoteDataSource userRemoteDataSource;


 UserInstructorRepoImpl( {required this.userRemoteDataSource,});

  @override
  Future<Either<Failure, UserInstructorEntity>> getUserInstructor() async {
    try{
      UserInstructorEntity? userEntity;
      userEntity = await userRemoteDataSource.getUserInstructor();
       return right(userEntity!);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }


  
}