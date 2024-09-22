import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/widgets/app_bar.dart';
import 'package:universityhup/core/functions/setup_service_locator.dart';
import 'package:universityhup/features/student_role/quizzes/domain/use_cases/submit_quiz_usecase.dart';

import '../../domain/use_cases/quiz_data_use_case.dart';
import '../../domain/use_cases/quiz_use_case.dart';
import '../manager/cubit/quiz_cubit.dart';
import '../widgets/quiz_builder.dart';


class QuizzesScreen extends StatelessWidget {
  const QuizzesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>QuizCubit(quizUseCase: getIt.get<QuizUseCase>(),
      quizDataUseCase: getIt.get<FetchQuizDataUseCase>(),
      submitQuizUseCase: getIt.get<SubmitQuizUseCase>())..fetchAllQuizzes(),
      child: BlocConsumer<QuizCubit,QuizState>(
        listener: (context,state){},
        builder: (context,state){
          return  Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    DefaultAppBar(context:context,),
                    const SizedBox(height: 40,),
                     Text('All Quizzes',
                    style:Theme.of(context).textTheme.titleLarge
                    ),
                    const SizedBox(height: 15,),
                    const Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 7.5),
                          child:QuizBuilder()
                        ),
                      ),
                  ],
                ),
              ),
      
      
            );
      
        },
      ),
    );
  }
}
