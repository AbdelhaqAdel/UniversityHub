import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/instructor_role/material/data/data_sources/material_file_local_data_source.dart';
import 'package:universityhup/features/instructor_role/material/data/data_sources/material_file_remote_data_source.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_file_entity.dart';
import 'package:universityhup/features/instructor_role/material/domain/repositories/material_files_repo.dart';


class InsMaterialFilesRepository extends InsMaterialFilesRepo{
  final InsMaterialFileRemoteDataSourceImpl filesDataSource;
  final InsMaterialFileLocalDataSourceImpl fileLocalDataSource;
  InsMaterialFilesRepository({required this.filesDataSource,required this.fileLocalDataSource,});

  @override
  Future<Either<Failure,List<FileEntity>>> getAllMaterialsFiles({required lecId}) async{
    try{
      final List<FileEntity>allFiles=await filesDataSource.fetchAllMaterialFiles(lecId:lecId);
      return right(allFiles);
    }catch(error){
    if(error is DioException){
      return left(ServerFailure.fromDiorError(error));
    }else{
      return left(ServerFailure(error.toString()));
    }}
  }

  //   @override
  // Future<Either<Failure,void>>loadFile({required String networkFile,})async{
  //   try{
  //  await filesDataSource.loadFile(networkFile: networkFile).then((value) {
  //     openFile(networkFile: value);
  //   });
  //   return right(null);
  //   }catch(error){
  //   if(error is DioException){
  //     return left(ServerFailure.fromDiorError(error));
  //   }else{
  //     return left(ServerFailure(error.toString()));
  //   }}
  //   }
  
  
//     @override
//   Future<void> openFile({required String networkFile}) async {
//     final path= await fileLocalDataSource.getFilePath(networkFile: networkFile);
//      OpenFile.open(path,).then((value) {
//       print(value.message);
//       if (value.message == 'the $path file does not exists') {
//         loadFile(networkFile:networkFile);
//       }
//     }).catchError((error) {
//       loadFile(networkFile: networkFile);
//     });
// }

}