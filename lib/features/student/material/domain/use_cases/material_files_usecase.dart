import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/core/use_cases/use_case.dart';
import 'package:universityhup/features/student/material/data/repositories/material_files_repo_impl.dart';
import 'package:universityhup/features/student/material/domain/entities/material_file_entity.dart';

class MaterialFilesUsecase extends UseCase<List<FileEntity>,NoParam>{
   MaterialFilesUsecase({required this.filesRepo});
   final MaterialFilesRepository filesRepo;
   
  @override
  Future<Either<Failure,List<FileEntity>>> call([NoParam? param]) {
  return filesRepo.getAllMaterialsFiles();
  }
}