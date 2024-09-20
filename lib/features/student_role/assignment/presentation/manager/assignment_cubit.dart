import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universityhup/features/student_role/assignment/domain/entities/assignment_entity.dart';
import '../../../../../core/functions/open_file.dart';
import '../../../../../core/utils/api_service.dart';
import '../../data/models/submit_assignment_input.dart';
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

  static AssignmentCubit get(context) => BlocProvider.of(context);
  final GetAssignmentUseCase getAssignmentUseCase;
  final GetAssignmentInfoUseCase getAssignmentInfoUseCase;
  final SubmitAssignmentUseCase submitAssignmentUseCase;

  void getAssignment() async {
    emit(GetAssignmentLoadingState());
    var result = await getAssignmentUseCase.call();
    result.fold((failure) {
      emit(GetAssignmentErrorState(failure.toString()));
    }, (right) {
      GetAssignmentSuccessState.completedAssignmentEntity =
          right.assignmentEntityCompleteList;
      GetAssignmentSuccessState.pendingAssignmentEntity =
          right.assignmentEntityPendingList;

      emit(GetAssignmentSuccessState());
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

  void submitAssignment({required String assignmentId}) async {
    emit(SubmitAssignmentLoadingState());
    SubmitAssignmentInputModel submitAssignmentInputModel =
        SubmitAssignmentInputModel(taskId: assignmentId, file: file);
    var result = await submitAssignmentUseCase.call(submitAssignmentInputModel);
    result.fold((failure) {
      emit(SubmitAssignmentErrorState(failure.toString()));
    }, (right) {
      emit(SubmitAssignmentSuccessState());
    });
  }
}
