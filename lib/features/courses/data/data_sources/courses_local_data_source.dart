
import 'package:hive/hive.dart';
import 'package:universityhup/core/constants/hive_constants.dart';
import 'package:universityhup/features/courses/data/models/all_courses_model.dart';

abstract class CoursesLocalDataSource {
  List<CoursesModel> fetchCoursesFromHive();
}
class CoursesLocalDataSourceImpl extends CoursesLocalDataSource{
  @override
 List<CoursesModel> fetchCoursesFromHive()  {
  List<CoursesModel>allCourses=[];
  var box= Hive.box<CoursesModel>(HiveConstants.coursesBox);
  allCourses=box.values.toList();
  return allCourses;
  }

}
