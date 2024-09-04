import 'package:hive_flutter/adapters.dart';
import 'package:universityhup/core/constants/hive_constants.dart';
import 'package:universityhup/features/AllCourses/data/models/courses_adapter.dart';

import '../constants/constant.dart';


Future<void> hiveSetup() async {
  await Hive.initFlutter();
Hive.registerAdapter(AllCoursesAdapter());


  await Hive.openBox(HiveConstants.kStartBox);
  await Hive.openBox(HiveConstants.coursesBox);

 
  var startBoxData = Hive.box(HiveConstants.kStartBox);
  isOnboarding = startBoxData.get('isOnboarding') ?? false;


}