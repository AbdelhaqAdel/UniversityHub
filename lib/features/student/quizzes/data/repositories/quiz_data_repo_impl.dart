import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/student/quizzes/data/data_sources/quiz_data_remote_datasource.dart';
import 'package:universityhup/features/student/quizzes/data/models/question_data_model.dart';
import 'package:universityhup/features/student/quizzes/domain/repositories/quiz_data_repo.dart';

class QuizDataRepository extends QuizDataRepo{
  final QuizDataRemoteDatasourceImpl quizDataSource;
  QuizDataRepository({required this.quizDataSource});

  @override
  Future<Either<Failure, List<Questions>>> getQuizData() async{
    try{
      final List<Questions>quizData=await quizDataSource.fetchQuizData();
      return right(quizData);
    }catch(error){
    if(error is DioException){
      return left(ServerFailure.fromDiorError(error));
    }else{
      return left(ServerFailure(error.toString()));
    }}
  }
}