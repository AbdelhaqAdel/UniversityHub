part of 'assignment_cubit.dart';


sealed class AssignmentState {}

final class AssignmentInitial extends AssignmentState {}

class GetAssignmentLoadingState extends AssignmentState{}
class GetAssignmentSuccessState extends AssignmentState{
  final List<AssignmentEntity>  assignmentEntity;
  GetAssignmentSuccessState({required this.assignmentEntity});
}
class GetAssignmentErrorState extends AssignmentState{
  final String errMessage;
  GetAssignmentErrorState(this.errMessage);
}

class GetAssignmentInfoLoadingState extends AssignmentState{}
class GetAssignmentInfoSuccessState extends AssignmentState{
  final AssignmentInfoEntity  assignmentInfoEntity;
  GetAssignmentInfoSuccessState({required this.assignmentInfoEntity});
}
class GetAssignmentInfoErrorState extends AssignmentState{
  final String errMessage;
  GetAssignmentInfoErrorState(this.errMessage);
}

class SubmitAssignmentLoadingState extends AssignmentState{}
class SubmitAssignmentSuccessState extends AssignmentState{}
class SubmitAssignmentErrorState extends AssignmentState{
  final String errMessage;
  SubmitAssignmentErrorState(this.errMessage);
}