import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/student/quizzes/domain/entities/quiz_entity.dart';
import 'package:universityhup/features/student/quizzes/domain/use_cases/quiz_usecase.dart';
part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit({required this.quizUsecase}) : super(QuizInitial());
  static QuizCubit get(context) => BlocProvider.of(context);
  final QuizUsecase quizUsecase; 
  Future<void>fetchAllQuizzes()async{
    emit(GetAllQuizzesLoadingState());
    final resault=await quizUsecase.call();
    resault.fold(
       (error)=>emit(GetAllQuizzesErrorState(error:error.message )),
       (quizzes)=>emit(GetAllQuizzesSuccessState(quizzes: quizzes)),

       );
  }
}
