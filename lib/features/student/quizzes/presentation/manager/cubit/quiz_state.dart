part of 'quiz_cubit.dart';

sealed class QuizState {}

final class QuizInitial extends QuizState {}

class GetAllQuizzesLoadingState extends QuizState {}

class GetAllQuizzesSuccessState extends QuizState {
  static String currentQuizId='';
  static void setCourseName({required quizId}){
    currentQuizId=quizId;
  }
 final List<QuizEntity> quizzes;
  GetAllQuizzesSuccessState({required this.quizzes});
}
class GetAllQuizzesErrorState extends QuizState {
  final String error;
  GetAllQuizzesErrorState({required this.error});
}