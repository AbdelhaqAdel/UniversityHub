import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/core/use_cases/use_case.dart';
import 'package:universityhup/features/student/quizzes/data/models/question_data_model.dart';
import '../../data/repositories/quiz_data_repo_impl.dart';

class QuizDataUsecase extends UseCase<List<Questions>,NoParam>{
   QuizDataUsecase({required this.quizDataRepo});
   final QuizDataRepository quizDataRepo;

  @override
  Future<Either<Failure, List<Questions>>> call([NoParam? param]) {
  return quizDataRepo.getQuizData();
  }
}