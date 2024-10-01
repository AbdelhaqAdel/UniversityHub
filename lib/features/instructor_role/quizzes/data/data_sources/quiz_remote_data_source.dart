import '../../../../../core/constants/constant.dart';
import '../../../../../core/utils/api_service.dart';
import '../../domain/entities/quiz_entity.dart';
import '../models/add_quiz_input.dart';
import '../models/quiz_model.dart';


abstract class QuizInstructorRemoteDataSource {
  Future<List<QuizInstructorEntity>> getQuizInstructor();
  Future addQuiz(
      {required AddQuizInputModel addQuizInputModel});
  Future deleteQuiz({required String quizId});
}

class QuizInstructorRemoteDataSourceImpl
    extends QuizInstructorRemoteDataSource {
  @override
  Future<List<QuizInstructorEntity>> getQuizInstructor() async {
    List<QuizInstructorEntity> quizEntityList = [];
    await DioHelper.get(
      url: 'Instructor/GetAllQuizesForOneCourse?cycleId=$currentCycleId',
      token: token,
    ).then((value) async {
      if (value.statusCode == 200) {
        var json = value.data;
        quizEntityList = setQuizInstructorData(json);
      }
    });
    return quizEntityList;
  }

  List<QuizInstructorEntity> setQuizInstructorData(
      List<dynamic> json) {
    List<QuizInstructorEntity> quizEntityList = [];
    for (var element in json) {
      quizEntityList.add(QuizInstructorModel.fromJson(element));
    }
    return quizEntityList;
  }

  @override
  Future deleteQuiz({required String quizId}) async {
    await DioHelper.deleteData(
      url: 'Instructor/DeleteQuiz?quizId=$quizId',
      token: token,
    );
  }

  @override
  Future addQuiz({required AddQuizInputModel addQuizInputModel}) async{
    DioHelper.post(
      url: 'Instructor/createQuiz',
      token: token,
      data: addQuizInputModel.toJson(),
    );
  }
}
