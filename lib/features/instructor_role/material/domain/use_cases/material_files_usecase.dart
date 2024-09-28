import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/core/use_cases/use_case.dart';
import 'package:universityhup/features/instructor_role/material/data/repositories/material_files_repo_impl.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_file_entity.dart';


class InsMaterialFilesUseCase extends UseCase<List<FileEntity>,String>{
   InsMaterialFilesUseCase({required this.filesRepo});
   final InsMaterialFilesRepository filesRepo;
   
  @override
  Future<Either<Failure,List<FileEntity>>> call([String? param]) {
  return filesRepo.getAllMaterialsFiles(lecId: param!);
  }
}