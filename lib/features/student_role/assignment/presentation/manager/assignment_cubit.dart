import 'package:bloc/bloc.dart';
import 'package:universityhup/features/student_role/assignment/domain/entities/assignment_entity.dart';
import '../../domain/entities/assignment_info_entity.dart';
import '../../domain/use_cases/get_assignment_info_usecase.dart';
import '../../domain/use_cases/get_assignment_usecase.dart';
import '../../domain/use_cases/submit_assignment_usecase.dart';
part 'assignment_state.dart';

class AssignmentCubit extends Cubit<AssignmentState> {
  AssignmentCubit(
      {required this.getAssignmentUseCase,
      required this.getAssignmentInfoUseCase,
      required this.submitAssignmentUseCase})
      : super(AssignmentInitial());

  final GetAssignmentUseCase getAssignmentUseCase;
  final GetAssignmentInfoUseCase getAssignmentInfoUseCase;
  final SubmitAssignmentUseCase submitAssignmentUseCase;



  void getAssignment() async {
    emit(GetAssignmentLoadingState());
    var result = await getAssignmentUseCase.call();
    result.fold((failure) {
      emit(GetAssignmentErrorState(failure.toString()));
    }, (right) {
      emit(GetAssignmentSuccessState(assignmentEntity: right));
    });
  }

  void getAssignmentInfo({required String assignmentId}) async {
    emit(GetAssignmentInfoLoadingState());
    var result = await getAssignmentInfoUseCase.call(assignmentId);
    result.fold((failure) {
      emit(GetAssignmentInfoErrorState(failure.toString()));
    }, (right) {
      emit(GetAssignmentInfoSuccessState(assignmentInfoEntity: right));
    });
  }

  void submitAssignment({required String assignmentId}) async {
    emit(SubmitAssignmentLoadingState());
    var result = await submitAssignmentUseCase.call(assignmentId);
    result.fold((failure) {
      emit(SubmitAssignmentErrorState(failure.toString()));
    }, (right) {
      emit(SubmitAssignmentSuccessState());
    });
  }

}

