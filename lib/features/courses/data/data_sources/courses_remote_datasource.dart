import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:universityhup/core/constants/constant.dart';
import 'package:universityhup/core/constants/hive_constants.dart';
import 'package:universityhup/core/functions/hive_function.dart';
import 'package:universityhup/core/utils/api_service.dart';
import 'package:universityhup/core/utils/end_point.dart';
import 'package:universityhup/features/courses/data/models/all_courses_model.dart';

abstract class CoursesRemoteDataSource{
  Future <List<CoursesModel>>fetchCourses();
}
class CoursesRemoteDataSourceImpl extends CoursesRemoteDataSource{
  List<CoursesModel>coursesList=[];
  @override
  Future<List<CoursesModel>> fetchCourses()async {
    try{
     await  DioHelper.get(
        url:role=="Student"? EndPoint.allCourses:EndPoint.insAllCourses,
        token:token,
      ).then((value) {
    HiveService.saveListOfType<CoursesModel>(coursesList, HiveConstants.coursesBox);
       fillCoursesList(value);
  }); 
   return coursesList;
  }catch(error){
    List<CoursesModel>localCourses=Hive.box<CoursesModel>(HiveConstants.coursesBox).values.toList();
    return localCourses;
  }
}
 void fillCoursesList(Response<dynamic> list) {

  coursesList=[];
     for (var element in list.data) {
     coursesList.add(CoursesModel.fromJson(element));
    }
  }

}
