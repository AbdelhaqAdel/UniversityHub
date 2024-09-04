
import 'package:go_router/go_router.dart';

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

    ],
  );
}
