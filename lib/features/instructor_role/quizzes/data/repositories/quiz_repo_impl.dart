import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';

import '../../domain/entities/quiz_entity.dart';
import '../../domain/repositories/quiz_repo.dart';
import '../data_sources/quiz_remote_data_source.dart';
import '../models/add_quiz_input.dart';


class QuizInstructorRepoImpl extends QuizInstructorRepo{
 final QuizInstructorRemoteDataSource quizRemoteDataSource;


 QuizInstructorRepoImpl( {required this.quizRemoteDataSource,});

  @override
  Future<Either<Failure, List<QuizInstructorEntity>>> getQuizInstructor() async {
    try{
      List<QuizInstructorEntity> quizEntityList = [];
       quizEntityList = await quizRemoteDataSource.getQuizInstructor();
       return right(quizEntityList);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteQuiz({required String quizId}) async {
    try{
      await quizRemoteDataSource.deleteQuiz(quizId: quizId);
      return right(null);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addQuiz({required AddQuizInputModel addQuizInputModel}) async{
    try{
      await quizRemoteDataSource.addQuiz(addQuizInputModel: addQuizInputModel);
      return right(null);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }


  
}