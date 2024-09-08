import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/student/quizzes/data/data_sources/quiz_remote_datasource.dart';
import 'package:universityhup/features/student/quizzes/domain/entities/quiz_entity.dart';
import 'package:universityhup/features/student/quizzes/domain/repositories/quiz_repo.dart';

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