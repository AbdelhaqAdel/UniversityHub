
import 'package:hive/hive.dart';
import 'package:universityhup/core/constants/hive_constants.dart';
import 'package:universityhup/features/AllCourses/data/models/all_courses_model.dart';

abstract class CoursesLocalDatasource {
  Future<List<CoursesModel>> fetchCoursesFromHive();
}
class CoursesLocalDatasourceImpl extends CoursesLocalDatasource{
  @override
  Future<List<CoursesModel>> fetchCoursesFromHive() async {
  var box= Hive.box<CoursesModel>(HiveConstants.coursesBox);
  print('getting cached data');
     return box.values.toList();
  }

}