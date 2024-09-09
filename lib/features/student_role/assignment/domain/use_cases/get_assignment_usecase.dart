
import 'package:dartz/dartz.dart';
import 'package:universityhup/features/student_role/assignment/domain/entities/assignment_entity.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../repositories/assignment_repo.dart';

class GetAssignmentUseCase extends UseCase<List<AssignmentEntity>,NoParam>{
 final AssignmentRepo assignmentRepo;

 GetAssignmentUseCase({required this.assignmentRepo});
  @override
  Future<Either<Failure, List<AssignmentEntity>>> call([NoParam? param]) {
  return assignmentRepo.getAssignment();
  }

}
