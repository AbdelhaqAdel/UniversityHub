import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/courses/data/models/all_courses_model.dart';

abstract class CoursesRepo{
 Future<Either<Failure, List<CoursesModel>>>getAllCourses();
}