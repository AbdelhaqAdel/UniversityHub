import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/instructor_role/material/data/repositories/material_repo_impl.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_folder_entity.dart';

class AddMaterialUseCase {
   AddMaterialUseCase({required this.materialRepo});
   final InsMaterialRepository materialRepo;
   Map<String,List<FolderEntity>>allMaterials={};

  Future<Either<Failure, void>> call({required String url,required bool isFolder, String ?folderName,File ?file,
  String?type,
}) async{
    return await materialRepo.addMaterial( url: url,
     isFolder:isFolder,
     folderName: folderName,
     type:type??'',
     file:file,
     );
  }
}