import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repo.dart';

class GetUserUseCase extends UseCase<UserEntity,NoParam>{
 final UserRepo userRepo;

 GetUserUseCase({required this.userRepo});
  @override
  Future<Either<Failure, UserEntity>> call([NoParam? param]) {
  return userRepo.getUser();
  }

}
