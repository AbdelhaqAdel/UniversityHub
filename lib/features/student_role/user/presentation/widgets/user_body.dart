import 'package:flutter/material.dart';
import 'package:universityhup/features/student_role/user/presentation/widgets/user_actions.dart';
import 'package:universityhup/features/student_role/user/presentation/widgets/user_image.dart';
import 'package:universityhup/features/student_role/user/presentation/widgets/user_name.dart';
import '../../domain/entities/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/custom_snack_bar.dart';

import '../manager/user_cubit.dart';
import '../manager/user_state.dart';
import 'is_verify.dart';

class UserBody extends StatefulWidget {
  const UserBody({
    super.key,
  });

  @override
  State<UserBody> createState() => _UserBodyState();
}

class _UserBodyState extends State<UserBody> {
  UserEntity? userEntity ;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if(state is GetUserSuccessState){
          userEntity=state.userEntity;
        }
      },
      builder: (context, state) {
        if(userEntity!=null ){
          return  Column(
            children: [
              const ProfileImage(),
              const SizedBox(
                height: 3,
              ),
              UserName(userEntity: userEntity),
              ButtonsActions(userEntity: userEntity),
              const IsVerify(),
            ],
          );

        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );

  }
}





