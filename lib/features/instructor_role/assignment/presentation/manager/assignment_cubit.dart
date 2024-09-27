import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universityhup/features/student_role/assignment/domain/entities/assignment_entity.dart';
import '../../../../../core/functions/open_file.dart';
import '../../../../../core/utils/api_service.dart';
import '../../data/models/submit_assignment_input.dart';
import '../../domain/entities/assignment_entity.dart';
import '../../domain/entities/assignment_info_entity.dart';
import '../../domain/use_cases/get_assignment_info_usecase.dart';
import '../../domain/use_cases/get_assignment_usecase.dart';
import '../../domain/use_cases/submit_assignment_usecase.dart';
part 'assignment_state.dart';

class AssignmentInstructorCubit extends Cubit<AssignmentInstructorState> {
  AssignmentInstructorCubit(
      {required this.getAssignmentInstructorUseCase,
      required this.getAssignmentInstructorInfoUseCase,
      required this.submitAssignmentInstructorUseCase})
      : super(AssignmentInstructorInitial());

  static AssignmentInstructorCubit get(context) => BlocProvider.of(context);
  final GetAssignmentInstructorUseCase getAssignmentInstructorUseCase;
  final GetAssignmentInstructorInfoUseCase getAssignmentInstructorInfoUseCase;
  final UpdateAssignmentInstructorUseCase submitAssignmentInstructorUseCase;

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

  void getAssignmentInstructorInfo({required String assignmentId}) async {
    emit(GetAssignmentInstructorInfoLoadingState());
    var result = await getAssignmentInstructorInfoUseCase.call(assignmentId);
    result.fold((failure) {
      emit(GetAssignmentInstructorInfoErrorState(failure.toString()));
    }, (right) {
      emit(GetAssignmentInstructorInfoSuccessState(assignmentInfoEntity: right));
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

  void submitAssignmentInstructor({required String assignmentId}) async {
    emit(SubmitAssignmentInstructorLoadingState());
    UpdateAssignmentInstructorInputModel submitAssignmentInstructorInputModel =
        UpdateAssignmentInstructorInputModel(taskId: assignmentId, file: file);
    var result = await submitAssignmentInstructorUseCase.call(submitAssignmentInstructorInputModel);
    result.fold((failure) {
      emit(SubmitAssignmentInstructorErrorState(failure.toString()));
    }, (right) {
      emit(SubmitAssignmentInstructorSuccessState());
    });
  }
}
