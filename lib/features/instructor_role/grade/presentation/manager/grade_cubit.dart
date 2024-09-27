import 'package:bloc/bloc.dart';
import '../../domain/use_cases/get_grade_usecase.dart';
import 'grade_state.dart';

class GradeCubit extends Cubit<GradeState> {
  GradeCubit(
      {required this.getGradeUseCase})
      : super(GradeInitial());

  final GetGradeUseCase getGradeUseCase;

  void getGrade() async {
    emit(GetGradeLoadingState());
    var result = await getGradeUseCase.call();
    result.fold((failure) {
      emit(GetGradeErrorState(failure.toString()));
    }, (right) {
      emit(GetGradeSuccessState(gradeEntity: right));
    });
  }



}

