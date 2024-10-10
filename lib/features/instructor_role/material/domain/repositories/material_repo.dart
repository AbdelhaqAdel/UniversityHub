import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_file_entity.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_folder_entity.dart';


abstract class InsMaterialRepo{
  Future<Either<Failure,List<FolderEntity>>>getAllMaterials({required String courseId});
  
    Future<Either<Failure, List<FileEntity>>>getAllMaterialsFiles({required lecId});

   Future<Either<Failure, void>>updateMaterial({
    required String url
  });

  Future<Either<Failure, void>>deleteMaterial({
    required String url
  });

  Future<Either<Failure, void>>addMaterial({
    String?folderName,  
    File ?file,
     required String type,
    required bool isFolder,
    required String url,  });
  
}