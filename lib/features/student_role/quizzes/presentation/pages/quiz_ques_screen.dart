import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/core/widgets/app_bar.dart';
import 'package:universityhup/core/style/colors.dart';
import 'package:universityhup/core/utils/app_router.dart';
import 'package:universityhup/core/widgets/custom_button.dart';
import 'package:universityhup/features/student_role/quizzes/data/models/question_data_model.dart';

import '../manager/cubit/quiz_cubit.dart';
import '../widgets/quiz ques/quiz_ques_builder.dart';

class QuizQuesScreen extends StatefulWidget {
  const QuizQuesScreen({super.key,});
  @override
  State<QuizQuesScreen> createState() => _QuizQuesScreenState();
}
class _QuizQuesScreenState extends State<QuizQuesScreen> {
  bool isLast = false;
  bool isStart = false;
  bool isBack=false;
  var boardController = PageController();
  List<Questions>?ques;
  String? quizId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (context, state) {
        if(state is GetAllQuizDataSuccessState) {
          ques=state.quizQues;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                 SizedBox(
                  height: MediaQuery.of(context).size.height*.04,
                ),
                DefaultAppBar(context: context),
                 SizedBox(
                  height: MediaQuery.of(context).size.height*.06,
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
                    QuesBuilder(isStart: isStart,
                    boardController: boardController, isLast: isLast, 
                    onPageChanged: (index ) {
                     if (index == ques!.length - 1) {
                        setState(() {
                          isLast = true;
                        });}
                      else if (index >=1) {
                        setState(() {
                          isStart = true;
                        });
                      } else {
                        setState(() {
                          isLast = false;
                          isStart = false;
                        });}},
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8),
                  child: Row(
                    children: [
                     isStart? Container(
                        height: MediaQuery.of(context).size.height*.07,
                        width: MediaQuery.of(context).size.width*.25,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(25),
                      ),
                        child: IconButton(
                          onPressed: (){
                            setState(() {
                              isLast = false;
                            });
                            boardController.previousPage (
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
                              color: KColors.buttonColor,
                              height: MediaQuery.of(context).size.height*.07,
                              width: double.infinity,
                              onTap: () {
                                if (isLast) {
                                  GoRouter.of(context).push(AppRouter.kQuizResultScreen,);
                                }
                                 else {
                                  boardController.nextPage(
                                    duration: const Duration(
                                      milliseconds: 750,
                                    ),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                  );
            
                                }
                                setState(() {
                                  isBack=false;
                                });
                              },
                              text: isLast ? 'Submit' : 'Next',
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
