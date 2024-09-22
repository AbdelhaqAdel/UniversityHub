import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';

import '../entities/material_file_entity.dart';

abstract class MaterialFilesRepo{
  Future<Either<Failure, List<FileEntity>>>getAllMaterialsFiles({required lecId});
    // Future<Either<Failure,void>>loadFile({required String networkFile});
    //   Future<void> openFile({ required String networkFile});

}