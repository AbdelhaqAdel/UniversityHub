
import 'package:go_router/go_router.dart';
import 'package:universityhup/features/courses/presentation/pages/all_courses_screen.dart';

import '../../features/layout/presentation/pages/layout.dart';
import '../../features/login/presentation/pages/login.dart';
import '../../features/onboarding/presentation/pages/onboarding.dart';
import '../../features/test/presentation/pages/test.dart';

abstract class AppRouter {
  static const kLayout = '/Layout';
  static const kLogin = '/Login';
  static const kRegister = '/Register';
  static const kOnboarding = '/Onboarding';


  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Onboarding(),
      ),
      GoRoute(
        path: kLogin,
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: kLayout,
        builder: (context, state) => const Layout(),
      ),

    ],
  );
}
