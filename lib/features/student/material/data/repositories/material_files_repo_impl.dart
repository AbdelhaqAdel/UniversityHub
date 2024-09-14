
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/student/material/data/data_sources/material_file_remote_datasource.dart';
import 'package:universityhup/features/student/material/domain/entities/material_file_entity.dart';
import 'package:universityhup/features/student/material/domain/repositories/material_files_repo.dart';

class MaterialFilesRepository extends MaterialFilesRepo{
  final MaterialFileRemoteDatasourceImpl filesDataSource;
  MaterialFilesRepository({required this.filesDataSource});

  @override
  Future<Either<Failure,List<FileEntity>>> getAllMaterialsFiles() async{
    try{
      final List<FileEntity>allFiles=await filesDataSource.fetchAllMaterialFiles();
      return right(allFiles);
    }catch(error){
    if(error is DioException){
      print(error.toString());
      return left(ServerFailure.fromDiorError(error));
    }else{
            print(error.toString());

      return left(ServerFailure(error.toString()));
    }}
  }
}