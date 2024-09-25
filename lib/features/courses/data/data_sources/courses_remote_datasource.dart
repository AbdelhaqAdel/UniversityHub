import 'package:dio/dio.dart';
import 'package:universityhup/core/constants/hive_constants.dart';
import 'package:universityhup/core/functions/hive_function.dart';
import 'package:universityhup/core/utils/api_service.dart';
import 'package:universityhup/core/utils/end_point.dart';
import 'package:universityhup/features/courses/data/models/all_courses_model.dart';
import 'package:universityhup/features/login/presentation/manager/login_cubit/login_cubit.dart';

abstract class CoursesRemoteDataSource{
  Future <List<CoursesModel>>fetchCourses();
}
class CoursesRemoteDataSourceImpl extends CoursesRemoteDataSource{
  List<CoursesModel>coursesList=[];
  @override
  Future<List<CoursesModel>> fetchCourses()async {
     await  DioHelper.get(
        url: EndPoint.allCourses,
        token:LoginSuccessState.loginEntity?.token,
      ).then((value) {
       fillCoursesList(value);
  });
    HiveService.saveDataToHive<CoursesModel>(coursesList, HiveConstants.coursesBox);
   return coursesList;
}
 void fillCoursesList(Response<dynamic> list) {
  coursesList=[];
     for (var element in list.data) {
     coursesList.add(CoursesModel.fromJson(element));
    }
  }

}
