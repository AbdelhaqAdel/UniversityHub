import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/student/material/domain/entities/material_file_entity.dart';

abstract class MaterialFilesRepo{
  Future<Either<Failure, List<FileEntity>>>getAllMaterialsFiles();
}