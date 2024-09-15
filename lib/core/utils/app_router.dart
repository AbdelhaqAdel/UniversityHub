
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/features/courses/presentation/pages/about%20course/about_screen.dart';
import 'package:universityhup/features/student/material/presentation/manager/cubit/material_cubit.dart';
import 'package:universityhup/features/student/material/presentation/pages/material_files_screen.dart';
import 'package:universityhup/features/student/material/presentation/pages/materials_screen.dart';
import 'package:universityhup/features/student/quizzes/presentation/manager/cubit/quiz_cubit.dart';
import 'package:universityhup/features/student/quizzes/presentation/pages/all_quizes_screen.dart';
import 'package:universityhup/features/student/quizzes/presentation/pages/quiz_ques_screen.dart';
import '../../features/layout/presentation/pages/layout.dart';
import '../../features/login/presentation/pages/login.dart';
import '../../features/student_role/assignment/presentation/pages/assignment_screen.dart';

abstract class AppRouter {
  static const kLayout = '/Layout';
  static const kLogin = '/Login';
  static const kRegister = '/Register';
  static const kOnboarding = '/Onboarding';
  static const kAboutCourse= '/AboutCourseScreen';
  static const kQuizzes= '/QuizzesScreen';
  static const kQuizzesQues= '/QuizQuesScreen';
    static const kMaterialFile= '/MaterialFileScreen';
  static const kAssignmentScreen= '/AssignmentScreen';



  

  static BuildContext? context1;

  static final router = GoRouter(
    
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Layout(),
      ),
      GoRoute(
        path: kLogin,
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: kLayout,
        builder: (context, state) => const Layout(),
      ),
      GoRoute(
        path: kAboutCourse,
        builder: (context, state) => const AboutCourseScreen(),
      ),
       GoRoute(
        path: kAssignmentScreen,
        builder: (context, state) => const AssignmentScreen(),
      ),
      GoRoute(
        path: kQuizzes,
        builder: (context, state) => const QuizzesScreen(),
      ),
      GoRoute(
        path: kQuizzesQues,
        builder: (context, state){
           return BlocProvider.value(
      value: context.read<QuizCubit>()..fetchQuizData(),
      child:const QuizQuesScreen(),
    );
        }
      ),
        GoRoute(
          
        path: kMaterialFile,
        builder: (context, state){
           return BlocProvider.value(
      value: context1!.read<MaterialCubit>(),
      child:const MaterialFileScreen(),
    );
        }

      ),

    ],
  );
}
