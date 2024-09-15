import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../entities/grade_entity.dart';
import '../repositories/grade_repo.dart';

class GetGradeUseCase extends UseCase<List<GradeEntity>,NoParam>{
 final GradeRepo gradeRepo;

 GetGradeUseCase({required this.gradeRepo});
  @override
  Future<Either<Failure, List<GradeEntity>>> call([NoParam? param]) {
  return gradeRepo.getGrade();
  }

}
