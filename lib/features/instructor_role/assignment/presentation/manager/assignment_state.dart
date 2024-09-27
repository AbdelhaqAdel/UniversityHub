part of 'assignment_cubit.dart';


sealed class AssignmentInstructorState {}

final class AssignmentInstructorInitial extends AssignmentInstructorState {}

class GetAssignmentInstructorLoadingState extends AssignmentInstructorState{}
class GetAssignmentInstructorSuccessState extends AssignmentInstructorState{
  static  List<AssignmentInstructorEntity>  pendingAssignmentInstructorEntity=[];
  static List<AssignmentInstructorEntity>  completedAssignmentInstructorEntity=[];

  GetAssignmentInstructorSuccessState();
}
class GetAssignmentInstructorErrorState extends AssignmentInstructorState{
  final String errMessage;
  GetAssignmentInstructorErrorState(this.errMessage);
}

class GetAssignmentInstructorInfoLoadingState extends AssignmentInstructorState{}
class GetAssignmentInstructorInfoSuccessState extends AssignmentInstructorState{
  final AssignmentInstructorInfoEntity  assignmentInfoEntity;
  GetAssignmentInstructorInfoSuccessState({required this.assignmentInfoEntity});
}
class GetAssignmentInstructorInfoErrorState extends AssignmentInstructorState{
  final String errMessage;
  GetAssignmentInstructorInfoErrorState(this.errMessage);
}

class DeleteAssignmentLoadingState extends AssignmentInstructorState{}
class DeleteAssignmentSuccessState extends AssignmentInstructorState{}
class DeleteAssignmentErrorState extends AssignmentInstructorState{
  final String errMessage;
  DeleteAssignmentErrorState(this.errMessage);
}

class PickFileLoading extends AssignmentInstructorState{}
class PickFileError extends AssignmentInstructorState{}
class PickFileSuccess extends AssignmentInstructorState{}

class UpdateAssignmentLoadingState extends AssignmentInstructorState{}
class UpdateAssignmentSuccessState extends AssignmentInstructorState{}
class UpdateAssignmentErrorState extends AssignmentInstructorState{
  final String errMessage;
  UpdateAssignmentErrorState(this.errMessage);
}


class AddAssignmentLoadingState extends AssignmentInstructorState{}
class AddAssignmentSuccessState extends AssignmentInstructorState{}
class AddAssignmentErrorState extends AssignmentInstructorState{
  final String errMessage;
  AddAssignmentErrorState(this.errMessage);
}


class SetGradeAssignmentLoadingState extends AssignmentInstructorState{}
class SetGradeAssignmentSuccessState extends AssignmentInstructorState{}
class SetGradeAssignmentErrorState extends AssignmentInstructorState{
  final String errMessage;
  SetGradeAssignmentErrorState(this.errMessage);
}
