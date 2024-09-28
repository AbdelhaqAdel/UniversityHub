import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/instructor_role/assignment/domain/use_cases/get_student_submit_assignment_usecase.dart';

import '../../../../../core/functions/open_file.dart';
import '../../data/models/add_assignment_input.dart';
import '../../data/models/set_grade_assignment_input.dart';
import '../../data/models/update_assignment_input.dart';
import '../../domain/entities/assignment_entity.dart';
import '../../domain/entities/student_task_uploaded_entity.dart';
import '../../domain/use_cases/add_assignment_usecase.dart';
import '../../domain/use_cases/delete_assignment_usecase.dart';
import '../../domain/use_cases/get_assignment_usecase.dart';
import '../../domain/use_cases/set_grade_assignment_usecase.dart';
import '../../domain/use_cases/update_assignment_usecase.dart';
part 'assignment_state.dart';

class AssignmentInstructorCubit extends Cubit<AssignmentInstructorState> {
  AssignmentInstructorCubit(
      {required this.getStudentSubmitAssignmentUsecase,
        required this.getAssignmentInstructorUseCase,
      required this.updateAssignmentInstructorUseCase,
      required this.setGradeAssignmentUseCase,
      required this.addAssignmentUseCase,
      required this.deleteAssignmentUseCase})
      : super(AssignmentInstructorInitial());

  static AssignmentInstructorCubit get(context) => BlocProvider.of(context);
  final GetAssignmentInstructorUseCase getAssignmentInstructorUseCase;
  final UpdateAssignmentInstructorUseCase updateAssignmentInstructorUseCase;
  final SetGradeAssignmentUseCase setGradeAssignmentUseCase;
  final DeleteAssignmentUseCase deleteAssignmentUseCase;
  final AddAssignmentUseCase addAssignmentUseCase;
  final GetStudentSubmitAssignmentUsecase getStudentSubmitAssignmentUsecase;

  void getAssignmentInstructor() async {
    emit(GetAssignmentInstructorLoadingState());
    var result = await getAssignmentInstructorUseCase.call();
    result.fold((failure) {
      emit(GetAssignmentInstructorErrorState(failure.toString()));
    }, (right) {
      GetAssignmentInstructorSuccessState.completedAssignmentInstructorEntity =
          right.assignmentEntityCompleteList;
      GetAssignmentInstructorSuccessState.pendingAssignmentInstructorEntity =
          right.assignmentEntityPendingList;

      emit(GetAssignmentInstructorSuccessState());
    });
  }

  void addAssignment({required AddAssignmentInputModel addAssignmentInputModel}) async {
    emit(AddAssignmentLoadingState());
    var result = await addAssignmentUseCase.call(addAssignmentInputModel);
    result.fold((failure) {
      emit(AddAssignmentErrorState(failure.toString()));
    }, (right) {
      emit(AddAssignmentSuccessState());
    });
  }

  void updateAssignment({required UpdateAssignmentInstructorInputModel updateAssignmentInstructorInputModel}) async {
    emit(UpdateAssignmentLoadingState());
    var result = await updateAssignmentInstructorUseCase.call(updateAssignmentInstructorInputModel);
    result.fold((failure) {
      emit(UpdateAssignmentErrorState(failure.toString()));
    }, (right) {
      getAssignmentInstructor();
      emit(UpdateAssignmentSuccessState());
    });
  }

  void deleteAssignment({required String assignmentId}) async {
    emit(DeleteAssignmentLoadingState());
    var result = await deleteAssignmentUseCase.call(assignmentId);
    result.fold((failure) {
      emit(DeleteAssignmentErrorState(failure.toString()));
    }, (right) {
      getAssignmentInstructor();
      emit(DeleteAssignmentSuccessState());
    });
  }

  void setGradeAssignment({required SetGradeAssignmentInputModel setGradeAssignmentInputModel}) async {
    emit(SetGradeAssignmentLoadingState());
    var result = await setGradeAssignmentUseCase.call(setGradeAssignmentInputModel);
    result.fold((failure) {
      print(failure.message);
      emit(SetGradeAssignmentErrorState(failure.toString()));
    }, (right) {
      emit(SetGradeAssignmentSuccessState());
    });
  }

  void getStudentSubmitAssignment({required String assignmentId}) async {
    emit(GetStudentSubmitAssignmentLoadingState());
    var result = await getStudentSubmitAssignmentUsecase.call(assignmentId);
    result.fold((failure) {
      emit(GetStudentSubmitAssignmentErrorState(failure.toString()));
    }, (right) {
      emit(GetStudentSubmitAssignmentSuccessState(studentTaskUploadedEntity: right));
    });
  }


  List<File> file = [];
  Future<void> callPickFile() async {
    emit(PickFileLoading());

    await pickFile().then((onValue) {
      file=onValue;
      emit(PickFileSuccess());

    }).catchError((onError) {
      emit(PickFileError());

    });
  }
}

