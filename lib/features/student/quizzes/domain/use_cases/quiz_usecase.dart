import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/core/use_cases/use_case.dart';
import 'package:universityhup/features/student/quizzes/data/repositories/quiz_repo_impl.dart';
import 'package:universityhup/features/student/quizzes/domain/entities/quiz_entity.dart';

class QuizUsecase extends UseCase<List<QuizEntity>,NoParam>{
   QuizUsecase({required this.quizRepo});
   final QuizRepository quizRepo;

  @override
  Future<Either<Failure, List<QuizEntity>>> call([NoParam? param]) {
  return quizRepo.getAllQuizes();
  }
}