import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/student/quizzes/data/models/question_data_model.dart';
import 'package:universityhup/features/student/quizzes/domain/entities/quiz_entity.dart';
import 'package:universityhup/features/student/quizzes/domain/use_cases/quiz_data_usecase.dart';
import 'package:universityhup/features/student/quizzes/domain/use_cases/quiz_usecase.dart';
part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit({required this.quizUsecase,required this.quizDataUseCase}) : super(QuizInitial());
  static QuizCubit get(context) => BlocProvider.of(context);
  final QuizUsecase quizUsecase; 
  final QuizDataUsecase quizDataUseCase; 
  Future<void>fetchAllQuizzes()async{
    emit(GetAllQuizzesLoadingState());
    final resault=await quizUsecase.call();
    resault.fold(
       (error)=>emit(GetAllQuizzesErrorState(error:error.message )),
       (quizzes)=>emit(GetAllQuizzesSuccessState(quizzes: quizzes)),

       );
  }

    Future<void>fetchQuizData()async{
    emit(GetAllQuizDataLoadingState());
    final resault=await quizDataUseCase.call();
    resault.fold(
       (error)=>emit(GetAllQuizDataErrorState(error:error.message )),
       (quizzes){
         allquizAnswers = List<String>.generate(
          quizzes.length,
              (index) => '',
        );
        GetAllQuizDataSuccessState.setCourseName(answers: allquizAnswers);
        emit(GetAllQuizDataSuccessState(quizzes: quizzes));
        },

       );
  }

    List<String>? allquizAnswers;
    void quizSelectAnswer(index, value) {
    allquizAnswers![index] = value;
    emit(ChangeQuizAnswerState());
  }
}
