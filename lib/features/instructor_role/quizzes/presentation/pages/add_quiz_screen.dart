import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/quiz_cubit.dart';
import '../widgets/add_quiz/add_quiz_body.dart';


class AddQuizScreen extends StatelessWidget {
  const AddQuizScreen({super.key, required this.cubit});
  final QuizInstructorCubit
      cubit; // Receive the cubit from the first screen

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: const Scaffold(
        body: AddQuizBody(),
      ),
    );
  }
}
