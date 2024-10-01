import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/custom_snack_bar.dart';
import '../manager/quiz_cubit.dart';
import '../manager/quiz_state.dart';
import 'complete_quiz.dart';

class CompleteQuizInstructorListView extends StatefulWidget {
  const CompleteQuizInstructorListView({
    super.key,
  });

  @override
  State<CompleteQuizInstructorListView> createState() =>
      _CompleteQuizInstructorListViewState();
}

class _CompleteQuizInstructorListViewState
    extends State<CompleteQuizInstructorListView> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizInstructorCubit, QuizInstructorState>(
      listener: (context, state) {
        if (state is GetQuizInstructorSuccessState) {
          showSnackBar(
              context: context, message: 'GetQuizInstructorSuccessState');
        }
      },
      builder: (context, state) {
        if (GetQuizInstructorSuccessState
            .completedQuizInstructorEntity.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {

                  },
                  child: CompleteQuizInstructor(
                    quizEntity: GetQuizInstructorSuccessState
                        .completedQuizInstructorEntity[index],
                    startDate: DateTime.parse(
                        GetQuizInstructorSuccessState
                            .completedQuizInstructorEntity[index]
                            .startDate!),
                    endDate: DateTime.parse(
                        GetQuizInstructorSuccessState
                            .completedQuizInstructorEntity[index]
                            .endDate!),
                  )),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: GetQuizInstructorSuccessState
                  .completedQuizInstructorEntity.length,
            ),
          );
        }
        else if(GetQuizInstructorSuccessState
            .completedQuizInstructorEntity.isEmpty && state is GetQuizInstructorLoadingState){
          return const Center(child: CircularProgressIndicator());
        }else{
          return const Center(child: Text('No Quizzes Here'));
        }
      },
    );
  }
}
