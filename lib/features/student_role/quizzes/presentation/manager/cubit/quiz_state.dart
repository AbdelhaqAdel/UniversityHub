part of 'quiz_cubit.dart';

sealed class QuizState {}

final class QuizInitial extends QuizState {}

class GetAllQuizzesLoadingState extends QuizState {}

class GetAllQuizzesSuccessState extends QuizState {
  static List<QuizEntity>allQuizzes=[];
  static void fillQuizList({required quizzes}){
    allQuizzes=quizzes;
  }
  GetAllQuizzesSuccessState();
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
 static void setQuizId({required id}){
   quizId=id;
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
  static int ?quizGrade;
  static void setQuizGrade({required grade}){
    quizGrade=grade;
  }
  SubmitQuizSuccessState();
}
class SubmitQuizErrorState extends QuizState{
    final String error;
   SubmitQuizErrorState({required this.error});
}