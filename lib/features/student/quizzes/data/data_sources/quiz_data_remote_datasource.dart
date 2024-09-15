import 'package:dio/dio.dart';
import 'package:universityhup/core/utils/api_service.dart';
import 'package:universityhup/core/utils/end_point.dart';
import 'package:universityhup/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:universityhup/features/student/quizzes/data/models/question_data_model.dart';

abstract class QuizDataRmoteDataSourse{
  Future <List<Questions>>fetchQuizData();
}
class QuizDataRemoteDatasourceImpl extends QuizDataRmoteDataSourse{
  List<Questions>quizData=[];
  
  @override
  Future<List<Questions>> fetchQuizData()async {
    await DioHelper.get(url:EndPoint.quizData,
    token: LoginSuccessState.loginEntity?.token
     ).then((value){
      fillQuizDataList(value);
    });
    return quizData;
  }
 void fillQuizDataList(Response<dynamic> list) {
  quizData=[];
     for (var element in list.data) {
     quizData.add(Questions.fromJson(element));
    }
  }
  
}
