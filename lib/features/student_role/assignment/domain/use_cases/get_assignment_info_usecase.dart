
import 'package:dartz/dartz.dart';
import 'package:universityhup/features/student_role/assignment/data/models/assignment_info_model.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../repositories/assignment_repo.dart';

class GetAssignmentInfoUseCase extends UseCase<void,String>{
 final AssignmentRepo assignmentRepo;

 GetAssignmentInfoUseCase({required this.assignmentRepo});
  @override
  Future<Either<Failure, AssignmentInfoModel>> call([String? assignmentId]) {
  return assignmentRepo.getAssignmentInfo(assignmentId: assignmentId!);
  }

}
