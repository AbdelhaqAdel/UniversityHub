import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/grade_entity.dart';


abstract class GradeRepo{
  Future<Either<Failure,List<GradeEntity>>>  getGrade();
}