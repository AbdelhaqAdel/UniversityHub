import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/student_role/quizzes/presentation/widgets/quez%20result/quiz_result_builder.dart';
import '../manager/cubit/quiz_cubit.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit,QuizState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: SafeArea(
            child:   Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50,),
                 const QuizResultBuilder(),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child:
                        TextButton(
                          onPressed: (){
                            // print('all answers :${cubit.allquizAnswers}');
                            // NavigateAndFinish(context, Layout_Screen());
                            // navigateTo(context,STU_About_course ());
                            // navigateTo(context,STU_Quizes_Screen ());
                          },
                          child: const Text('Done',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            ),
                          ),
                        ),
                      ),
                    ),
                  ) ,
                ],
              ),
          ),
        );
      },
    );
  }
}
