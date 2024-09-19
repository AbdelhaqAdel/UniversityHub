part of 'quiz_cubit.dart';

sealed class QuizState {}

final class QuizInitial extends QuizState {}

class GetAllQuizzesLoadingState extends QuizState {}

class GetAllQuizzesSuccessState extends QuizState {
  static String currentQuizId='';
  static void setQuizId({required quizId}){
    currentQuizId=quizId;
  }
 final List<QuizEntity> quizzes;
  GetAllQuizzesSuccessState({required this.quizzes});
}
class GetAllQuizzesErrorState extends QuizState {
  final String error;
  GetAllQuizzesErrorState({required this.error});
}


class GetAllQuizDataLoadingState extends QuizState {}

class GetAllQuizDataSuccessState extends QuizState {
  static List<String> quesAnswers=[];
  static void setCourseName({required answers}){
    answers=answers;
  }
 final List<Questions> quizQues;
 final List<String>quizAnswers;
 static String?quizId;
 static void setQuizId({required quizId}){
   quizId=quizId;
 }
  GetAllQuizDataSuccessState({required this.quizQues,required this.quizAnswers,});
}
class GetAllQuizDataErrorState extends QuizState {
  final String error;
  GetAllQuizDataErrorState({required this.error});
}

class ChangeQuizAnswerState extends QuizState{}


class SubmitQuizLoadingState extends QuizState{}
class SubmitQuizSuccessState extends QuizState{
  final int quizGrade ;
  SubmitQuizSuccessState({required this.quizGrade});
}
class SubmitQuizErrorState extends QuizState{
    final String error;
   SubmitQuizErrorState({required this.error});
}