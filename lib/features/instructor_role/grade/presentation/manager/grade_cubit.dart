import 'package:bloc/bloc.dart';
import 'package:universityhup/features/instructor_role/grade/domain/use_cases/get_students_for_course_use_case.dart';
import '../../domain/use_cases/get_grade_usecase.dart';
import 'grade_state.dart';

class InsGradeCubit extends Cubit<InsGradeState> {
  InsGradeCubit(
      {required this.getGradeUseCase,required this.getStudentsForCourseUseCase})
      : super(GradeInitial());

  final InsGetGradeUseCase getGradeUseCase;
  final GetStudentsForCourseUseCase getStudentsForCourseUseCase;
  void getGrade({required String studentId}) async {
    emit(GetGradeLoadingState());
    var result = await getGradeUseCase.call(studentId);
    result.fold((failure) {
      emit(GetGradeErrorState(failure.toString()));
    }, (allGrades) {
      GetGradeSuccessState.setTotalGrade(allGrades['total']);
      emit(GetGradeSuccessState(gradeEntity: allGrades['stuGrades']));
    });
  }

 void getStudentsForCourse() async {
    emit(GetStudentForCourseLoadingState());
    var result = await getStudentsForCourseUseCase.call();
    result.fold((failure) {
      emit(GetStudentForCourseErrorState(failure.toString()));
    }, (right) {
      GetStudentForCourseSuccessState.setAllStudents(right);
      emit(GetStudentForCourseSuccessState());
    });
  }


}

