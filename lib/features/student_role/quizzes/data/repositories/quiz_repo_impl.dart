import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:universityhup/core/errors/failure.dart';

import '../../domain/entities/quiz_entity.dart';
import '../../domain/repositories/quiz_repo.dart';
import '../data_sources/quiz_remote_datasource.dart';

class QuizRepository extends QuizzesRepo{
  final QuizzesRemoteDatasourceImpl quizDataSource;
  QuizRepository({required this.quizDataSource});

  @override
  Future<Either<Failure, List<QuizEntity>>> getAllQuizes() async{
    try{
      final List<QuizEntity>allQuizes=await quizDataSource.fetchAllQuizes();
      return right(allQuizes);
    }catch(error){
    if(error is DioException){
      return left(ServerFailure.fromDiorError(error));
    }else{
      return left(ServerFailure(error.toString()));
    }}
  }
}