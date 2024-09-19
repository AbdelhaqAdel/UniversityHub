import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/core/use_cases/use_case.dart';
import '../../data/models/question_data_model.dart';
import '../../data/repositories/quiz_data_repo_impl.dart';

class FetchQuizDataUseCase extends UseCase<List<Questions>,String>{
   FetchQuizDataUseCase({required this.quizDataRepo});
   final QuizDataRepository quizDataRepo;

  @override
  Future<Either<Failure, List<Questions>>> call([String? param]) {
  return quizDataRepo.getQuizData(quizId: param!);
  }
}