import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:universityhup/core/errors/failure.dart';

import '../../domain/entities/quiz_entity.dart';
import '../../domain/repositories/quiz_repo.dart';
import '../data_sources/quiz_remote_data_source.dart';

class QuizRepository extends QuizzesRepo{
  final QuizzesRemoteDataSourceImpl quizDataSource;
  QuizRepository({required this.quizDataSource});

  @override
  Future<Either<Failure, List<QuizEntity>>> getAllQuizzes() async{
    try{
      final List<QuizEntity>allQuizzes=await quizDataSource.fetchAllQuizzes();
      return right(allQuizzes);
    }catch(error){
    if(error is DioException){
      return left(ServerFailure.fromDiorError(error));
    }else{
      return left(ServerFailure(error.toString()));
    }}
  }
}