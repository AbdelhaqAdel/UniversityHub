import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/user_entity.dart';


abstract class UserInstructorRepo{
  Future<Either<Failure,UserInstructorEntity>>  getUserInstructor();
}