import 'package:flutter/material.dart';
import 'package:universityhup/features/student/quizzes/domain/entities/quiz_entity.dart';
import 'package:universityhup/features/student/quizzes/presentation/widgets/quiz_custom_widget.dart';

class QuizzesListView extends StatelessWidget {
  const QuizzesListView({
    required this.quiz,
    super.key});
  final List<QuizEntity>quiz;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount:quiz.length,
      itemBuilder:(context,index)=> InkWell(
        onTap: (){
      //  GetAllCoursesSuccessState.setCourseName(coursename: quiz[index].name);
      //  GoRouter.of(context).push(AppRouter.kQuizzes);
        },
        child: QuizWidget(quiz:quiz[index],index: index,)),
      separatorBuilder: (context,index)=>const SizedBox(height: 25,),
    );
  }
}