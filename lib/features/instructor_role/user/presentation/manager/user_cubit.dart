import 'package:bloc/bloc.dart';
import '../../domain/use_cases/get_user_info_usecase.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(
      {required this.getUserUseCase})
      : super(UserInitial());

  final GetUserUseCase getUserUseCase;

  void getUser() async {
    emit(GetUserLoadingState());
    var result = await getUserUseCase.call();
    result.fold((failure) {
      emit(GetUserErrorState(failure.toString()));
    }, (right) {
      emit(GetUserSuccessState(userEntity: right));
    });
  }



}

