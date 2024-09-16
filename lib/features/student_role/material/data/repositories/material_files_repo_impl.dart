
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:universityhup/core/errors/failure.dart';
import '../../domain/entities/material_file_entity.dart';
import '../../domain/repositories/material_files_repo.dart';
import '../data_sources/material_file_remote_datasource.dart';

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