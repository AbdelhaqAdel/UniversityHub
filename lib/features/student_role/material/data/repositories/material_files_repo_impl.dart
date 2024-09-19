
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:universityhup/core/errors/failure.dart';
import '../../domain/entities/material_file_entity.dart';
import '../../domain/repositories/material_files_repo.dart';
import '../data_sources/material_file_remote_datasource.dart';

class MaterialFilesRepository extends MaterialFilesRepo{
  final MaterialFileRemoteDataSourceImpl filesDataSource;
  MaterialFilesRepository({required this.filesDataSource});

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
}