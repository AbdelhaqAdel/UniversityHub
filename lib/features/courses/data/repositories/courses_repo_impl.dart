import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/courses/data/data_sources/courses_local_datasource.dart';
import 'package:universityhup/features/courses/data/data_sources/courses_remote_datasource.dart';
import 'package:universityhup/features/courses/data/models/all_courses_model.dart';
import 'package:universityhup/features/courses/domain/repositories/courses_repo.dart';

class CoursesRepository extends CoursesRepo{
  final CoursesRmoteDataSourse coursesDataSource;
  final CoursesLocalDatasource coursesLocalDatasource;
  CoursesRepository({required this.coursesDataSource,required this.coursesLocalDatasource});
  @override
  Future<Either<Failure, List<CoursesModel>>> getAllCourses() async{

  try{
    //  List<CoursesModel>cachedCourses = await coursesLocalDatasource
    //      .fetchCoursesFromHive();
    //  if(cachedCourses.isNotEmpty){
    //    return right(cachedCourses);
    //  }
   List<CoursesModel>courses=await coursesDataSource.fetchCourses();
    return right(courses);
  }catch(error){
    if(error is DioException){
      return left(ServerFailure.fromDiorError(error));
    }else{
      return left(ServerFailure(error.toString()));
    }
   }
  }
}