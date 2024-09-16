import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:universityhup/core/errors/failure.dart';

import '../../domain/repositories/quiz_data_repo.dart';
import '../data_sources/quiz_data_remote_datasource.dart';
import '../models/question_data_model.dart';

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