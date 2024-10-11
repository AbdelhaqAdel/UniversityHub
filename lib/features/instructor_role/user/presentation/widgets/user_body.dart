import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/instructor_role/user/domain/entities/user_entity.dart';
import 'package:universityhup/features/instructor_role/user/presentation/widgets/user_actions.dart';
import 'package:universityhup/features/instructor_role/user/presentation/widgets/user_image.dart';
import 'package:universityhup/features/instructor_role/user/presentation/widgets/user_name.dart';
import '../../../../../core/functions/custom_snack_bar.dart';

import '../manager/user_cubit.dart';
import '../manager/user_state.dart';
import 'is_verify.dart';

class UserInstructorBody extends StatefulWidget {
  const UserInstructorBody({
    super.key,
  });

  @override
  State<UserInstructorBody> createState() => _UserInstructorBodyState();
}

class _UserInstructorBodyState extends State<UserInstructorBody> {
  UserInstructorEntity? userEntity ;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserInstructorCubit, UserInstructorState>(
      listener: (context, state) {
        if(state is GetUserInstructorSuccessState){
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
              UserInstructorName(userEntity: userEntity),
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





