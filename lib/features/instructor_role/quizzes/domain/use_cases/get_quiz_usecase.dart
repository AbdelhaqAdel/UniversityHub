import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../entities/quiz_entity.dart';
import '../repositories/quiz_repo.dart';

class GetQuizInstructorUseCase extends UseCase<
    ({
    List<QuizInstructorEntity> quizEntityCompleteList,
    List<QuizInstructorEntity> quizEntityPendingList
    }),
    NoParam> {
 final QuizInstructorRepo quizRepo;

 GetQuizInstructorUseCase({required this.quizRepo});

 @override
 Future<
     Either<
         Failure,
         ({
         List<QuizInstructorEntity> quizEntityCompleteList,
         List<QuizInstructorEntity> quizEntityPendingList
         })>> call([NoParam? param]) async {
  final result = await quizRepo.getQuizInstructor();
  return result.fold(
       (failure) => Left(failure),
       (quizEntityList) {
    var filteredData = filterQuizInstructorData(quizEntityList);
    return Right(filteredData);
   },
  );
 }

 ({
 List<QuizInstructorEntity> quizEntityPendingList,
 List<QuizInstructorEntity> quizEntityCompleteList
 }) filterQuizInstructorData(List<QuizInstructorEntity> quizEntityList) {
  List<QuizInstructorEntity> quizEntityCompleteList = [];
  List<QuizInstructorEntity> quizEntityPendingList = [];
  for (var element in quizEntityList) {
   if (DateTime.now().isBefore(DateTime.parse(element.endDate!))) {
    quizEntityPendingList.add(element);
   } else {
    quizEntityCompleteList.add(element);
   }
  }
  return (
  quizEntityPendingList: quizEntityPendingList,
  quizEntityCompleteList: quizEntityCompleteList
  );
 }
}
