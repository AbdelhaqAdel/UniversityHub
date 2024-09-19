
import '../../domain/entities/user_entity.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

class GetUserLoadingState extends UserState{}
class GetUserSuccessState extends UserState{
  final UserEntity  userEntity;
  GetUserSuccessState({required this.userEntity});
}
class GetUserErrorState extends UserState{
  final String errMessage;
  GetUserErrorState(this.errMessage);
}
