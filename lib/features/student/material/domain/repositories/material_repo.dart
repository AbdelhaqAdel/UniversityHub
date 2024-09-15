import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/student/material/domain/entities/material_folder_entity.dart';

abstract class MaterialRepo{
  Future<Either<Failure, Map<String,List<FolderEntity>>>>getAllMaterials();
}