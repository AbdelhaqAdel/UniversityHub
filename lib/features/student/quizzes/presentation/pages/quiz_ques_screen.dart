import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/functions/app_bar.dart';
import 'package:universityhup/core/widgets/custom_button.dart';
import 'package:universityhup/features/student/quizzes/presentation/manager/cubit/quiz_cubit.dart';
import 'package:universityhup/features/student/quizzes/presentation/widgets/quez%20ques/quiz_ques_builder.dart';



class QuizQuesScreen extends StatefulWidget {
  const QuizQuesScreen({super.key});

  @override
  State<QuizQuesScreen> createState() => _QuizQuesScreenState();
}

class _QuizQuesScreenState extends State<QuizQuesScreen> {
  bool islast = false;
  bool isStart = false;
  bool isBack=false;
  var boardcontroller = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                DefaultAppBar(context: context),
                const SizedBox(
                  height: 30,
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: Row(
                    children: [
                      Text(
                        'Quiz ',
                        style:Theme.of(context).textTheme.titleLarge
                      ),
                      Text(
                        '1',
                       style:Theme.of(context).textTheme.titleLarge

                      ),
                      const Spacer(),
                      Text(
                        '1:25 ',
                       style:Theme.of(context).textTheme.titleLarge

                      ),
                      const SizedBox(
                        width: 5,
                      ),
                       Icon(
                        FontAwesomeIcons.clock,
                        size: 20.sp,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child:
                    QuesBuilder(islast: islast, isStart: isStart,
                    boardController: boardcontroller,
                    )
                    //  ConditionalBuilder(
                    //   condition: state is GetAllQuizDataSuccessState,
                    //   builder:(context)=> PageView.builder(
                    //     physics: const NeverScrollableScrollPhysics(),
                    //     onPageChanged: (index) {
                    //       if (index == ques.length - 1) {
                    //         setState(() {
                    //           islast = true;
                    //         });
                    //       }
                    //       else if (index >=1) {
                    //         setState(() {
                    //           isStart = true;
                    //         });
                    //       } else {
                    //         setState(() {
                    //           islast = false;
                    //           isStart = false;
                    //         });
                    //       }
                    //     },     
                    //     controller: boardcontroller,
                    //     itemBuilder: (context, index) => QuizQuesWidget(
                    //       qIndex: index,
                    //       questions: ques[index]
                    //     ),
                    //     itemCount:ques.length
                    //   ),
                    //   fallback: (context)=>Center(child: CircularProgressIndicator(),),
                    // ),
                 
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8),
                  child: Row(
                    children: [
                     isStart? Container(
                        height: 50,
                        width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(25),
                      ),
                        child: IconButton(
                          onPressed: (){
                            setState(() {
                              islast = false;
                            });
                            boardcontroller.previousPage (
                              duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn,
                            );
                            setState(() {
                              isBack=true;
                            });
                          },
                          icon:const Icon(FontAwesomeIcons.backward,
                            color: Colors.blue,
                          )
                        ),
                      ):const SizedBox(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                            child: CustomButton(
                              width: double.infinity,
                              // containerHeight: 50,
                              onTap: () {
                                // if (islast) {
                                //   cubit.SumitQuiz();
                                //     NavigateAndFinish(context,
                                //         const QuizResultScreen());
                                // }
                                //  else {
                                  boardcontroller.nextPage(
                                    duration: const Duration(
                                      milliseconds: 750,
                                    ),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                  );

                                // }
                                setState(() {
                                  isBack=false;
                                });
                              },
                              text: islast ? 'Submit' : 'Next',
                            ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
