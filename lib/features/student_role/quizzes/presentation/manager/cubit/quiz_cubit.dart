import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/question_data_model.dart';
import '../../../domain/entities/quiz_entity.dart';
import '../../../domain/use_cases/quiz_data_usecase.dart';
import '../../../domain/use_cases/quiz_usecase.dart';
part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit({required this.quizUsecase,required this.quizDataUseCase}) : super(QuizInitial());
  static QuizCubit get(context) => BlocProvider.of(context);
  final QuizUsecase quizUsecase; 
  final FetchQuizDataUseCase quizDataUseCase; 
  Future<void>fetchAllQuizzes()async{
    emit(GetAllQuizzesLoadingState());
    final result=await quizUsecase.call();
    result.fold(
       (error)=>emit(GetAllQuizzesErrorState(error:error.message )),
       (quizzes)
       {
        emit(GetAllQuizzesSuccessState(quizzes: quizzes));},
       );
  }

    void fetchQuizData({required String quizId})async{
    emit(GetAllQuizDataLoadingState());
    final result=await quizDataUseCase.call(quizId);
    result.fold(
       (error)=>emit(GetAllQuizDataErrorState(error:error.message )),
       (quizQues){
         allQuizAnswers = List<String>.generate(
          quizQues.length,
              (index) => '',
        );
        emit(GetAllQuizDataSuccessState(quizQues: quizQues,quizAnswers: allQuizAnswers!));
        },

       );
  }

    List<String>? allQuizAnswers;
    void quizSelectAnswer(index, value) {
    allQuizAnswers![index] = value;
    emit(ChangeQuizAnswerState());
  }
}
