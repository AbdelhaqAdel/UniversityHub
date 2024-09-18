import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/student_role/quizzes/data/data_sources/quiz_data_remote_data_Source.dart';

import '../../domain/repositories/quiz_data_repo.dart';
import '../models/question_data_model.dart';

class QuizDataRepository extends QuizDataRepo{
  final QuizDataRemoteDataSourceImpl quizDataSource;
  QuizDataRepository({required this.quizDataSource});

  @override
  Future<Either<Failure, List<Questions>>> getQuizData({required String quizId}) async{
    try{
      final List<Questions>quizData=await quizDataSource.fetchQuizData(quizId: quizId);
      return right(quizData);
    }catch(error){
    if(error is DioException){
      return left(ServerFailure.fromDiorError(error));
    }else{
      return left(ServerFailure(error.toString()));
    }}
  }
}