import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/student/quizzes/data/models/question_data_model.dart';

abstract class QuizDataRepo{
 Future<Either<Failure, List<Questions>>>getQuizData();
}