import 'package:hive_flutter/adapters.dart';
import 'package:universityhup/core/constants/hive_constants.dart';
import 'package:universityhup/features/courses/data/models/all_courses_model.dart';
import 'package:universityhup/features/student/material/domain/entities/material_file_entity.dart';
import 'package:universityhup/features/student/material/domain/entities/material_folder_entity.dart';

import '../constants/constant.dart';


Future<void> hiveSetup() async {
  await Hive.initFlutter();
Hive.registerAdapter(CoursesModelAdapter());
Hive.registerAdapter(FolderEntityAdapter());
Hive.registerAdapter(FileEntityAdapter());



  await Hive.openBox(HiveConstants.kStartBox);
  await Hive.openBox(HiveConstants.coursesBox);

 
  var startBoxData = Hive.box(HiveConstants.kStartBox);
  isOnboarding = startBoxData.get('isOnboarding') ?? false;


}