import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/functions/app_bar.dart';
import 'package:universityhup/core/functions/setup_service_locator.dart';
import 'package:universityhup/features/student/quizzes/domain/use_cases/quiz_usecase.dart';
import 'package:universityhup/features/student/quizzes/presentation/manager/cubit/quiz_cubit.dart';
import 'package:universityhup/features/student/quizzes/presentation/widgets/quiz_builder.dart';


class QuizzesScreen extends StatelessWidget {
  const QuizzesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>QuizCubit(quizUsecase: getIt.get<QuizUsecase>())..fetchAllQuizzes(),
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
                       
                          //  ConditionalBuilder(
                          //   condition: quiz.isNotEmpty && state is ! Stu_Get_Course_Quiz_LoadingState,
                          //   builder:(context)=> ListView.separated(
                          //     physics: const BouncingScrollPhysics(),
                          //     itemBuilder:(context,index)=> STU_Quiz_Card(
                          //     quiz: quiz[index],
                          //         quizIsComplete: cubit.stu_Quiz_IsComplete,
                          //         context: context,
                          //         index:
                          //         index),
                          //     separatorBuilder: (context,index)=>const SizedBox(height: 25,),
                          //     itemCount: quiz.length,
                          //   ),
                          //   fallback: (context)=>Center(child: CircularProgressIndicator()),
                          // ),
                       
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
