import 'package:dio/dio.dart';
import 'package:universityhup/core/utils/api_service.dart';
import 'package:universityhup/core/utils/end_point.dart';
import 'package:universityhup/features/login/presentation/manager/login_cubit/login_cubit.dart';

import '../models/question_data_model.dart';

abstract class QuizDataRemoteDataSource{
  Future <List<Questions>>fetchQuizData({required String  quizId});
}
class QuizDataRemoteDataSourceImpl extends QuizDataRemoteDataSource{
  List<Questions>quizData=[];
  
  @override
  Future<List<Questions>> fetchQuizData({required String quizId})async {
    await DioHelper.get(url:'${EndPoint.quizData}$quizId',
    token: LoginSuccessState.loginEntity?.token
     ).then((value){
      fillQuizDataList(value);
    });
    return quizData;
  }
 void fillQuizDataList(Response<dynamic> list) {
  quizData=[];
     for (var element in list.data['questions']) {
     quizData.add(Questions.fromJson(element));
    }
    quizData.forEach((element) {
      print(element.text);
    });
  }
  
}
