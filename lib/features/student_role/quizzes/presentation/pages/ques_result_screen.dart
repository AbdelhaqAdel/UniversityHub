import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/features/student_role/quizzes/presentation/widgets/quez%20result/quiz_result_builder.dart';
import '../manager/cubit/quiz_cubit.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit,QuizState>(
      listener: (context,state){
        if(state is SubmitQuizSuccessState){
          QuizCubit.get(context).fetchAllQuizzes();
        }
      },
      builder: (context,state){
        return Scaffold(
          body: SafeArea(
            child:   ListView(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   SizedBox(height: MediaQuery.of(context).size.height/15,),
                 const QuizResultBuilder(),
                   SizedBox(height: MediaQuery.of(context).size.height/15,),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height/15,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child:
                        TextButton(
                          onPressed: (){
                           GoRouter.of(context).pop();
                           GoRouter.of(context).pop();
                            },
                          child: Text('Done',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.sp
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
