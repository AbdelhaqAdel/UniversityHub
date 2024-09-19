import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/core/use_cases/use_case.dart';
import '../../data/repositories/quiz_data_repo_impl.dart';

class SubmitQuizUseCase extends UseCase<int,String>{
   SubmitQuizUseCase({required this.quizDataRepo});
   final QuizDataRepository quizDataRepo;

  @override
  Future<Either<Failure, int>> call([String? param, List<String>? quizAnswers]) {
  return quizDataRepo.submitQuiz(quizId: param!, quizAnswers: quizAnswers!);
  }
}