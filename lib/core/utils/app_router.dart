import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/features/courses/presentation/pages/about%20course/about_screen.dart';
import 'package:universityhup/features/student_role/material/presentation/pages/materials_screen.dart';
import 'package:universityhup/features/student_role/quizzes/presentation/pages/ques_result_screen.dart';
import '../../features/layout/presentation/pages/layout.dart';
import '../../features/login/presentation/pages/login.dart';
import '../../features/student_role/assignment/presentation/pages/assignment_screen.dart';
import '../../features/student_role/grade/presentation/pages/grade_screen.dart';
import '../../features/student_role/material/presentation/manager/cubit/material_cubit.dart';
import '../../features/student_role/material/presentation/pages/material_files_screen.dart';
import '../../features/student_role/quizzes/presentation/manager/cubit/quiz_cubit.dart';
import '../../features/student_role/quizzes/presentation/pages/all_quizes_screen.dart';
import '../../features/student_role/quizzes/presentation/pages/quiz_ques_screen.dart';

abstract class AppRouter {
  static const kLayout = '/Layout';
  static const kLogin = '/Login';
  static const kRegister = '/Register';
  static const kOnboarding = '/Onboarding';
  static const kAboutCourse = '/AboutCourseScreen';
  static const kQuizzes = '/QuizzesScreen';
  static const kQuizzesQues = '/QuizQuesScreen';
  static const kMaterialFolders = '/MaterialScreen';
  static const kMaterialFile = '/MaterialFileScreen';
  static const kAssignmentScreen = '/AssignmentScreen';
  static const kGrade = '/Grade';
  static const kQuizResultScreen='/QuizResultScreen';
  //---------------------------

  static BuildContext? context1;

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Login(),
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
       builder: (context, state) {
         final quizId = state.extra as String;
         return BlocProvider.value(
           value: context1!.read<QuizCubit>()..fetchQuizData(quizId: quizId),
           child: const QuizQuesScreen(),
         );
       },
     ),
      GoRoute(
          path: kMaterialFile,
          builder: (context, state) {
          final lecId = state.extra as String;

            return BlocProvider.value(
              value: context1!.read<MaterialCubit>()..fetchMaterialFiles(lecId: lecId),
              child: const MaterialFileScreen(),
            );
          }),
      GoRoute(
        path: kGrade,
        builder: (context, state) => const GradeScreen(),
      ),
    GoRoute(
        path: kQuizResultScreen,
       builder: (context, state) {
        //  final quizId = state.extra as String;
         return BlocProvider.value(
           value: context1!.read<QuizCubit>()..submitQuiz(quizId:GetAllQuizDataSuccessState.quizId!),
           child: const QuizResultScreen(),
         );
       },
     ),
      
      GoRoute(
        path: kMaterialFolders,
        builder: (context, state) => MaterialScreen(),
      ),


    ],
  );
}
