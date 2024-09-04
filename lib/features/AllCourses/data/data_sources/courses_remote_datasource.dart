import 'package:dio/dio.dart';
import 'package:universityhup/core/constants/hive_constants.dart';
import 'package:universityhup/core/functions/hive_function.dart';
import 'package:universityhup/core/utils/api_service.dart';
import 'package:universityhup/core/utils/end_point.dart';
import 'package:universityhup/features/AllCourses/data/models/all_courses_model.dart';

abstract class CoursesRmoteDataSourse{
  Future <List<CoursesModel>>fetchCourses();
}
class CoursesRemoteDatasourceImpl extends CoursesRmoteDataSourse{
  List<CoursesModel>coursesList=[];
  @override
  Future<List<CoursesModel>> fetchCourses()async {
     await  DioHelper.get(
        url: EndPoint.allCourses,
        token: 'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJhYmR1bG1hamVlZHNhbGxhbSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6IkFiZHVsTWFqZWVkU2FsbGFtQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlN0dWRlbnQiLCJleHAiOjE3MjU2NTMzMzEsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcyODYiLCJhdWQiOiJNeVNlY3VyZWRBcGlVc2VycyJ9.wWU3aYuyclcRU_lJM9GF54fndMSATcQdp4KfBrsk_NQ',
      ).then((value) {
       fillCoursesList(value);
  });
    HiveService.saveDataToHive<CoursesModel>(HiveConstants.coursesBox,coursesList, HiveConstants.coursesBox);
   return coursesList;
}
 void fillCoursesList(Response<dynamic> list) {
     for (var element in list.data) {
     coursesList.add(CoursesModel.fromJson(element));
    }
  }

}
