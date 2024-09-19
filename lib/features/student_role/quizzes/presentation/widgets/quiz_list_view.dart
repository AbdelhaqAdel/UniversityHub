import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/core/utils/app_router.dart';
import 'package:universityhup/features/student_role/quizzes/presentation/manager/cubit/quiz_cubit.dart';
import 'package:universityhup/features/student_role/quizzes/presentation/widgets/quiz_custom_widget.dart';
import '../../domain/entities/quiz_entity.dart';

class QuizzesListView extends StatelessWidget {
  const QuizzesListView({
    required this.quiz,
    required this.context1,
    super.key});
  final List<QuizEntity>quiz;
  final BuildContext context1;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount:quiz.length,
      itemBuilder:(context,index)=> InkWell(
        onTap: (){
      //  GetAllCoursesSuccessState.setCourseName(coursename: quiz[index].name);
      // QuizCubit.get(context).fetchQuizData();
      GetAllQuizDataSuccessState.setQuizId(quizId: quiz[index].id);
      AppRouter.context1=context1;
       GoRouter.of(context1).push(AppRouter.kQuizzesQues,extra: quiz[index].id,);
        },
        child: QuizWidget(quiz:quiz[index],index: index,)),
      separatorBuilder: (context,index)=>const SizedBox(height: 25,),
    );
  }
}