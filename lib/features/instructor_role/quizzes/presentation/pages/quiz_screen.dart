import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/core/utils/app_router.dart';
import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/setup_service_locator.dart';
import '../../domain/repositories/quiz_repo.dart';
import '../../domain/use_cases/add_quiz_usecase.dart';
import '../../domain/use_cases/delete_quiz_usecase.dart';
import '../../domain/use_cases/get_quiz_usecase.dart';
import '../manager/quiz_cubit.dart';
import '../manager/quiz_state.dart';
import '../widgets/quiz_body.dart';


class QuizInstructorScreen extends StatelessWidget {
  const QuizInstructorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      QuizInstructorCubit(
        getQuizInstructorUseCase: GetQuizInstructorUseCase(
          quizRepo: getIt.get<QuizInstructorRepo>(),
        ),
        addQuizUseCase: AddQuizUseCase(
          quizRepo: getIt.get<QuizInstructorRepo>(),
        ),
        deleteQuizUseCase: DeleteQuizUseCase(
          quizRepo: getIt.get<QuizInstructorRepo>(),
        ),)
        ..getQuizInstructor(),
      child:  Scaffold(
        floatingActionButton: const _AddQuizActionButton(),
        body: BlocConsumer<QuizInstructorCubit, QuizInstructorState>(
          listener: (context, state) {
            if(state is AddQuizSuccessState){
              showSnackBar(context: context, message: 'quiz Created');
              GoRouter.of(context).pop();

              QuizInstructorCubit.get(context).getQuizInstructor();
            }
            },
          builder: (context, state) {
            return const QuizInstructorBody();
          },
        ),
      ),
    );
  }
}

class _AddQuizActionButton extends StatelessWidget {
  const _AddQuizActionButton();

  @override
  Widget build(context) {
    return FloatingActionButton(
      onPressed: () {
        GoRouter.of(context).push(AppRouter.kAddQuizScreen, extra: {
          'cubit': QuizInstructorCubit.get(context),
        });
      },
      backgroundColor: Colors.blue,
      shape: const CircleBorder(),
      child: const FaIcon(FontAwesomeIcons.plus, color: Colors.white,),
    );
  }
}
