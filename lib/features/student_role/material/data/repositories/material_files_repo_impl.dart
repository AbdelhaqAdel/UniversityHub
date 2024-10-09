import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/student_role/material/data/data_sources/material_file_local_data_source.dart';
import '../../domain/entities/material_file_entity.dart';
import '../../domain/repositories/material_files_repo.dart';
import '../data_sources/material_file_remote_data_source.dart';

class MaterialFilesRepository extends MaterialFilesRepo{
  final MaterialFileRemoteDataSourceImpl filesDataSource;
  final MaterialFileLocalDataSourceImpl fileLocalDataSource;
  MaterialFilesRepository({required this.filesDataSource,required this.fileLocalDataSource,});

  @override
  Future<Either<Failure,List<FileEntity>>> getAllMaterialsFiles({required lecId}) async{
    List<FileEntity>localFiles=fileLocalDataSource.fetchFilesFromHive(folderId: lecId);
    try{
      final List<FileEntity>allFiles=await filesDataSource.fetchAllMaterialFiles(lecId:lecId);
      if(allFiles.isEmpty){
        return right(localFiles);
      }
      return right(allFiles);
    }catch(error){
    if(error is DioException){
       if(ServerFailure.fromDiorError(error).message =='No Internet Connection'&&localFiles.isNotEmpty){
            return right(localFiles);
          }
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