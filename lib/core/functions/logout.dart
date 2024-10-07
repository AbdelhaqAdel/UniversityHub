

import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:universityhup/core/constants/hive_constants.dart';

import '../../features/instructor_role/user/domain/entities/user_entity.dart';
import '../../features/login/domain/entities/login_entity.dart';
import '../../features/news/domain/entities/news_entity.dart';
import '../../features/student_role/user/domain/entities/user_entity.dart';
import '../constants/constant.dart';
import '../utils/app_router.dart';

void logout(context) {

   isLogin=null;
   token=null;
   currentCycleId=null;
   currentCycleName=null;
   role=null;
   userEntity=null;
   loginEntity=null;
   Hive.box<NewsEntity>(HiveConstants.kNewsBox).clear();
   Hive.box(HiveConstants.kStartBox).clear();
   Hive.box<LoginEntity>(HiveConstants.kLoginEntityBox).clear();
   Hive.box<UserInstructorEntity>(HiveConstants.kUserInstructorBox).clear();
   Hive.box<UserEntity>(HiveConstants.kUserStudentBox).clear();
   // Hive.box<>(HiveConstants.coursesBox).clear();
   // Hive.box<>(HiveConstants.materialBox).clear();

   GoRouter.of(context).go(AppRouter.kLogin);






}