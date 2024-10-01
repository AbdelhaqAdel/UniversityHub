import '../../domain/entities/quiz_entity.dart';

abstract class QuizInstructorState {}

final class QuizInstructorInitial extends QuizInstructorState {}

class GetQuizInstructorLoadingState extends QuizInstructorState{}
class GetQuizInstructorSuccessState extends QuizInstructorState{
  static  List<QuizInstructorEntity>  pendingQuizInstructorEntity=[];
  static List<QuizInstructorEntity>  completedQuizInstructorEntity=[];

  GetQuizInstructorSuccessState();
}
class GetQuizInstructorErrorState extends QuizInstructorState{
  final String errMessage;
  GetQuizInstructorErrorState(this.errMessage);
}




class DeleteQuizLoadingState extends QuizInstructorState{}
class DeleteQuizSuccessState extends QuizInstructorState{}
class DeleteQuizErrorState extends QuizInstructorState{
  final String errMessage;
  DeleteQuizErrorState(this.errMessage);
}



class PickDateTime extends QuizInstructorState{}

class CheckState extends QuizInstructorState{}
class QuestionActionState extends QuizInstructorState{}




class AddQuizLoadingState extends QuizInstructorState{}
class AddQuizSuccessState extends QuizInstructorState{}
class AddQuizErrorState extends QuizInstructorState{
  final String errMessage;
  AddQuizErrorState(this.errMessage);
}


