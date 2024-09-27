
import '../../domain/entities/user_entity.dart';

sealed class UserInstructorState {}

final class UserInstructorInitial extends UserInstructorState {}

class GetUserInstructorLoadingState extends UserInstructorState{}
class GetUserInstructorSuccessState extends UserInstructorState{
  final UserInstructorEntity  userEntity;
  GetUserInstructorSuccessState({required this.userEntity});
}
class GetUserInstructorErrorState extends UserInstructorState{
  final String errMessage;
  GetUserInstructorErrorState(this.errMessage);
}
