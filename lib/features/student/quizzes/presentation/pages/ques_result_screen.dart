
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/student/quizzes/presentation/manager/cubit/quiz_cubit.dart';


class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit,QuizState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          
          // body: SafeArea(
          //   child: ConditionalBuilder(
          //     condition: cubit.quizGrade!=null,
          //     builder:(context)=> Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         const SizedBox(height: 50,),
          //         const Text('Finished!',
          //           style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 35
          //         ),),
          //         const Text(' Answers have been sent successfully',
          //           style: TextStyle(
          //               fontSize: 15
          //           ),),
          //         const SizedBox(height: 100,),
          //          Text('Your Points :',
          //          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          //            fontSize: 25,
          //          ),
          //          ),
          //         Padding(
          //           padding: const EdgeInsets.all(15.0),
          //           child: Stack(
          //             alignment: AlignmentDirectional.center,
          //             children:[ Image.asset(
          //                    'assets/images/check1.png',
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.only(right: 25.0,bottom: 20),
          //               child: Text('${cubit.quizGrade}',style: TextStyle(
          //                 color: Colors.blue,
          //                 fontSize: 50
          //               ),),
          //             ),
          //             ]),
          //         ),
          //         const Spacer(),
          //         Padding(
          //           padding: const EdgeInsets.all(15.0),
          //           child: Container(
          //             height: 50,
          //             decoration: BoxDecoration(
          //               color: Colors.blue,
          //               borderRadius: BorderRadius.circular(20),
          //             ),
          //             child: Center(
          //               child:
          //               TextButton(
          //                 onPressed: (){
          //                   print('all answers :${cubit.allquizAnswers}');
          //                   NavigateAndFinish(context, Layout_Screen());
          //                   navigateTo(context,STU_About_course ());
          //                   navigateTo(context,STU_Quizes_Screen ());
          //                 },
          //                 child: const Text('Done',
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 25
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ) ,
          //       ],
          //     ),
          //     fallback:(context)=> const Center(child: CircularProgressIndicator()),
          //   ),
          // ),

        );
      },
    );
  }
}
