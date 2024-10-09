import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/courses/data/data_sources/courses_local_data_source.dart';
import 'package:universityhup/features/courses/data/data_sources/courses_remote_datasource.dart';
import 'package:universityhup/features/courses/data/models/all_courses_model.dart';
import 'package:universityhup/features/courses/domain/repositories/courses_repo.dart';

class CoursesRepository extends CoursesRepo{
  final CoursesRemoteDataSource coursesDataSource;
  final CoursesLocalDataSource coursesLocalDataSource;
  CoursesRepository({required this.coursesDataSource,required this.coursesLocalDataSource});
  @override
  Future<Either<Failure, List<CoursesModel>>> getAllCourses() async{
     List<CoursesModel>coursesFromHive= coursesLocalDataSource.fetchCoursesFromHive();
   try{
      List<CoursesModel>courses=await coursesDataSource.fetchCourses();
        if(courses.isEmpty){
      return right(coursesFromHive);
    }
    return right(courses);
     }catch(error){
         if(error is DioException){
          if(ServerFailure.fromDiorError(error).message =='No Internet Connection'&&coursesFromHive.isNotEmpty){
            return right(coursesFromHive);
          }
      return left(ServerFailure.fromDiorError(error));
    }else{
      return left(ServerFailure(error.toString()));
    }
       }  }

}