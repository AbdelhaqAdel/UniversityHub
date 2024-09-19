import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/core/use_cases/use_case.dart';

import '../../data/repositories/quiz_repo_impl.dart';
import '../entities/quiz_entity.dart';

class QuizUseCase extends UseCase<List<QuizEntity>,NoParam>{
   QuizUseCase({required this.quizRepo});
   final QuizRepository quizRepo;

  @override
  Future<Either<Failure, List<QuizEntity>>> call([NoParam? param]) {
  return quizRepo.getAllQuizzes();
  }
}