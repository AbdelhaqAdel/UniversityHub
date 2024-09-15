import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/student/quizzes/domain/entities/quiz_entity.dart';

abstract class QuizzesRepo{
 Future<Either<Failure, List<QuizEntity>>>getAllQuizes();
}