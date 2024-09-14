import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/core/use_cases/use_case.dart';
import 'package:universityhup/features/student/material/data/repositories/material_repo_impl.dart';
import 'package:universityhup/features/student/material/domain/entities/material_folder_entity.dart';


class MaterialUsecase extends UseCase<Map<String,List<FolderEntity>>,NoParam>{
   MaterialUsecase({required this.materialRepo});
   final MaterialRepository materialRepo;

  @override
  Future<Either<Failure, Map<String,List<FolderEntity>>>> call([NoParam? param]) {
  return materialRepo.getAllMaterials();
  }
}