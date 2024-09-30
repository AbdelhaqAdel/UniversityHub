import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../entities/grade_entity.dart';
import '../repositories/grade_repo.dart';

class InsGetGradeUseCase extends UseCase<Map<String, dynamic>,String>{
 final InsGradeRepo gradeRepo;
   Map<String,dynamic>allGrades={};

 InsGetGradeUseCase({required this.gradeRepo});
  @override
  Future<Either<Failure,Map<String, dynamic>>> call([String? param]) async{
  final result =await gradeRepo.getGrade(studentId:param! );
  result.fold((error)=>left(error),
  (stuGrades){
    filterGradesIntoMap(stuGrades);
  });
  return right(allGrades);
  }

  void filterGradesIntoMap(List<InsGradeEntity> list) {
    double totalGrade=0;
  allGrades={};
     for (InsGradeEntity element in list) {
       totalGrade+=element.grade!;
    }
   allGrades.addAll({"total":totalGrade,"stuGrades":list});
  }


}
