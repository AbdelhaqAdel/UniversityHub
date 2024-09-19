import 'package:dio/dio.dart';
import 'package:universityhup/core/utils/api_service.dart';
import 'package:universityhup/core/utils/end_point.dart';
import 'package:universityhup/features/login/presentation/manager/login_cubit/login_cubit.dart';

import '../../domain/entities/quiz_entity.dart';
import '../models/quiz_model.dart';

abstract class QuizzesRemoteDataSource{
  Future <List<QuizEntity>>fetchAllQuizzes();
}
class QuizzesRemoteDataSourceImpl extends QuizzesRemoteDataSource{
  List<QuizEntity>quizzesList=[];
  
  @override
  Future<List<QuizEntity>> fetchAllQuizzes()async {
    await DioHelper.get(url:EndPoint.allQuizzes,
    token: LoginSuccessState.loginEntity?.token
     ).then((value){
      fillQuizList(value);
    });
    return quizzesList;
  }
 void fillQuizList(Response<dynamic> list) {
  quizzesList=[];
     for (var element in list.data) {
     quizzesList.add(QuizModel.fromJson(element));
    }
  }
  
}
