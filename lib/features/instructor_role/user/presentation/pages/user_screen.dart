import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/setup_service_locator.dart';
import '../../domain/repositories/user_repo.dart';
import '../../domain/use_cases/get_user_info_usecase.dart';
import '../manager/user_cubit.dart';
import '../widgets/user_body.dart';


class UserInstructorScreen extends StatelessWidget {
  const UserInstructorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserCubit(
              getUserUseCase: GetUserUseCase(
                userRepo: getIt.get<UserRepo>(),
              ),
            )..getUser(),
      child: const UserBody(),
    );
  }
}
