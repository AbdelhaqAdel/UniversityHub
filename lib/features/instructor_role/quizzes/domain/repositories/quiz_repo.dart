
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../data/models/add_quiz_input.dart';
import '../entities/quiz_entity.dart';

abstract class QuizInstructorRepo{
  Future<Either<Failure,List<QuizInstructorEntity>>>  getQuizInstructor();
  Future<Either<Failure,void>>  deleteQuiz({required String quizId});
  Future<Either<Failure,void>>  addQuiz({required AddQuizInputModel addQuizInputModel});
}