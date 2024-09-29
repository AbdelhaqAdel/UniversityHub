import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/core/use_cases/use_case.dart';
import 'package:universityhup/features/instructor_role/material/data/repositories/material_repo_impl.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_folder_entity.dart';

class DeleteMaterialUseCase extends UseCase<void,String>{
   DeleteMaterialUseCase({required this.materialRepo});
   final InsMaterialRepository materialRepo;
   Map<String,List<FolderEntity>>allMaterials={};
  @override
  Future<Either<Failure, void>> call([String? url]) async{
    return await materialRepo.deleteMaterial( url: url!);
  }
}