import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../../data/models/add_quiz_input.dart';
import '../repositories/quiz_repo.dart';



class AddQuizUseCase extends UseCase<void,AddQuizInputModel>{
 final QuizInstructorRepo quizRepo;


 AddQuizUseCase({required this.quizRepo});
  @override
  Future<Either<Failure, void>> call([AddQuizInputModel? addQuizInputModel ]) {
  return quizRepo.addQuiz(addQuizInputModel: addQuizInputModel!);
  }

}
