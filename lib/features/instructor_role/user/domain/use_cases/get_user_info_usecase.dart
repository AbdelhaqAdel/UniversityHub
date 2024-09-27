import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repo.dart';

class GetUserInstructorUseCase extends UseCase<UserInstructorEntity,NoParam>{
 final UserInstructorRepo userRepo;

 GetUserInstructorUseCase({required this.userRepo});
  @override
  Future<Either<Failure, UserInstructorEntity>> call([NoParam? param]) {
  return userRepo.getUserInstructor();
  }

}
