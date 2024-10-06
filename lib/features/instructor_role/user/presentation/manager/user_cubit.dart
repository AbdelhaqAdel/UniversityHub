import 'package:bloc/bloc.dart';
import '../../domain/use_cases/get_user_info_usecase.dart';
import 'user_state.dart';

class UserInstructorCubit extends Cubit<UserInstructorState> {
  UserInstructorCubit(
      {required this.getUserInstructorUseCase})
      : super(UserInstructorInitial());

  final GetUserInstructorUseCase getUserInstructorUseCase;

  void getUserInstructor() async {
    emit(GetUserInstructorLoadingState());
    var result = await getUserInstructorUseCase.call();
    result.fold((failure) {
      print(failure.message);
      emit(GetUserInstructorErrorState(failure.toString()));
    }, (right) {
      emit(GetUserInstructorSuccessState(userEntity: right));
    });
  }



}

