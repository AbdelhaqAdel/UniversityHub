import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universityhup/config/theme.dart';
import 'package:universityhup/core/utils/api_service.dart';
import 'core/functions/hive_setup.dart';
import 'core/functions/setup_service_locator.dart';
import 'core/functions/system_ui_overlay_style.dart';
import 'core/utils/app_router.dart';
import 'core/utils/simple_bloc_observer.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  systemStatesNavigationBar();
  setupServiceLocator();
  await hiveSetup();
  DioHelper.init();
  DioHelperForFiles.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
                designSize: const Size(428, 926),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (_, child) {
    return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
        //  darkTheme: darkTheme,
          themeMode: ThemeMode.light,
          routerConfig: AppRouter.router,
        );
      
  });}
}
