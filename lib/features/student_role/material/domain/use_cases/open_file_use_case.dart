import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/core/use_cases/use_case.dart';
import 'package:universityhup/features/student_role/material/domain/repositories/material_files_repo.dart';

class OpenFileUseCase extends UseCase<void,String>{
   OpenFileUseCase({required this.fileRepo});
   final MaterialFilesRepo fileRepo;
  @override
  Future<Either<Failure, void>> call([String? param]) async{
   fileRepo.openFile(networkFile: param!);
   return right(null);
  }
}