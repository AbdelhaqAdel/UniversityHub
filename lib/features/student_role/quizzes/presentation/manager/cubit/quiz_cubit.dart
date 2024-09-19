import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/student_role/quizzes/domain/use_cases/submit_quiz_usecase.dart';
import '../../../data/models/question_data_model.dart';
import '../../../domain/entities/quiz_entity.dart';
import '../../../domain/use_cases/quiz_data_usecase.dart';
import '../../../domain/use_cases/quiz_usecase.dart';
part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit({required this.quizUsecase,required this.quizDataUseCase,required this.submitQuizUseCase}) : super(QuizInitial());
  static QuizCubit get(context) => BlocProvider.of(context);
  SubmitQuizUseCase submitQuizUseCase;
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
        emit(GetAllQuizDataSuccessState(quizQues: quizQues,quizAnswers: allQuizAnswers!,));
        },

       ); }

  List<String>? allQuizAnswers;
  void submitQuiz({required String quizId})async{
    print(allQuizAnswers?.length);
    emit(SubmitQuizLoadingState());
    final response=await submitQuizUseCase.call(quizId,allQuizAnswers);
    response.fold((error)=>emit(SubmitQuizErrorState(error: error.message)),
     (grade)=>emit(SubmitQuizSuccessState(quizGrade: grade)),
     );
}
}