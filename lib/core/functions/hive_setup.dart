import 'package:hive_flutter/adapters.dart';
import 'package:universityhup/core/constants/hive_constants.dart';
import 'package:universityhup/features/courses/data/models/all_courses_model.dart';

import '../../features/instructor_role/user/domain/entities/user_entity.dart';
import '../../features/login/domain/entities/login_entity.dart';
import '../../features/student_role/material/domain/entities/material_file_entity.dart';
import '../../features/student_role/material/domain/entities/material_folder_entity.dart';
import '../../features/student_role/user/domain/entities/user_entity.dart';
import '../constants/constant.dart';

Future<void> hiveSetup() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CoursesModelAdapter());
  Hive.registerAdapter(FolderEntityAdapter());
  Hive.registerAdapter(FileEntityAdapter());
  Hive.registerAdapter(UserEntityAdapter());
  Hive.registerAdapter(UserInstructorEntityAdapter());
  Hive.registerAdapter(LoginEntityAdapter());

  await Hive.openBox(HiveConstants.kStartBox);
  await Hive.openBox(HiveConstants.coursesBox);
  await Hive.openBox<FolderEntity>(HiveConstants.materialBox);
  await Hive.openBox<UserEntity>(HiveConstants.kUserStudentBox);
  await Hive.openBox<UserInstructorEntity>(HiveConstants.kUserInstructorBox);
  await Hive.openBox<LoginEntity>(HiveConstants.kLoginEntityBox);

  var startBoxData = Hive.box(HiveConstants.kStartBox);
  isOnboarding = startBoxData.get('isOnboarding') ?? false;

  var box = Hive.box<LoginEntity>(HiveConstants.kLoginEntityBox);
  loginEntity = box.get('loginEntity');

}
