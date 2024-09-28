import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_folder_entity.dart';


abstract class InsMaterialRepo{
  Future<Either<Failure,List<FolderEntity>>>getAllMaterials({required String courseId});
}