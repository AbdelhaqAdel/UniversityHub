import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../repositories/quiz_repo.dart';

class DeleteQuizUseCase extends UseCase<void,String>{
 final QuizInstructorRepo quizRepo;

 DeleteQuizUseCase({required this.quizRepo});
  @override
  Future<Either<Failure, void>> call([String? quizId]) {
  return quizRepo.deleteQuiz(quizId: quizId!);
  }

}
