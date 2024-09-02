
import 'package:go_router/go_router.dart';

import '../../features/test/presentation/pages/test.dart';

abstract class AppRouter {
  static const kFoodDetails = '/FoodDetails';
  static const kLayout = '/Layout';
  static const kLogin = '/Login';
  static const kRegister = '/Register';
  static const kOnboarding = '/Onboarding';
  static const kLoginOrRegister = '/LoginOrRegister';
  static const kThankYou = '/ThankYou';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => test(),
      ),

    ],
  );
}
