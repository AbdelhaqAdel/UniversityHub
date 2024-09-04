import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/AllCourses/data/data_sources/courses_remote_datasource.dart';
import 'package:universityhup/features/AllCourses/data/models/all_courses_model.dart';
import 'package:universityhup/features/AllCourses/domain/repositories/courses_repo.dart';

class CoursesRepository extends CoursesRepo{
  final CoursesRmoteDataSourse coursesDataSource;
  CoursesRepository({required this.coursesDataSource});
  @override
  Future<Either<Failure, List<CoursesModel>>> getAllCourses() async{
  try{
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