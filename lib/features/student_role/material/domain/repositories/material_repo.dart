import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';

import '../entities/material_folder_entity.dart';

abstract class MaterialRepo{
  Future<Either<Failure,List<FolderEntity>>>getAllMaterials({required String courseId});
}