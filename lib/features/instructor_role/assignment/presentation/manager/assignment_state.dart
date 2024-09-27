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

class SubmitAssignmentInstructorLoadingState extends AssignmentInstructorState{}
class SubmitAssignmentInstructorSuccessState extends AssignmentInstructorState{}
class SubmitAssignmentInstructorErrorState extends AssignmentInstructorState{
  final String errMessage;
  SubmitAssignmentInstructorErrorState(this.errMessage);
}

class PickFileLoading extends AssignmentInstructorState{}
class PickFileError extends AssignmentInstructorState{}
class PickFileSuccess extends AssignmentInstructorState{}
