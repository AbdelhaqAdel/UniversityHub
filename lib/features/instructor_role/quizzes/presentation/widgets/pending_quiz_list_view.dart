import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/instructor_role/quizzes/presentation/widgets/pending_quiz.dart';

import '../../../../../core/functions/custom_snack_bar.dart';
import '../manager/quiz_cubit.dart';
import '../manager/quiz_state.dart';

class PendingQuizInstructorListView extends StatefulWidget {
  const PendingQuizInstructorListView({
    super.key,
  });

  @override
  State<PendingQuizInstructorListView> createState() =>
      _PendingQuizInstructorListViewState();
}

class _PendingQuizInstructorListViewState extends State<PendingQuizInstructorListView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizInstructorCubit, QuizInstructorState>(
      listener: (context, state) {
        if (state is GetQuizInstructorSuccessState) {
        }
      },
      builder: (context, state) {
        if (GetQuizInstructorSuccessState.pendingQuizInstructorEntity.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => PendingQuizInstructor(
                quizEntity: GetQuizInstructorSuccessState
                    .pendingQuizInstructorEntity[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount:
                  GetQuizInstructorSuccessState.pendingQuizInstructorEntity.length,
            ),
          );
        }  else if(GetQuizInstructorSuccessState
            .pendingQuizInstructorEntity.isEmpty && state is GetQuizInstructorLoadingState){
          return const Center(child: CircularProgressIndicator());
        }else{
          return const Center(child: Text('No Quizzes Here'));
        }
      },
    );
  }
}
