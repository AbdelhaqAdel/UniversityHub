
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/instructor_role/material/data/data_sources/material_remote_data_source.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_file_entity.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_folder_entity.dart';
import 'package:universityhup/features/instructor_role/material/domain/repositories/material_repo.dart';

class InsMaterialRepository extends InsMaterialRepo{
  final InsMaterialRemoteDataSourceImpl materialDataSource;
  InsMaterialRepository({required this.materialDataSource});

  @override
  Future<Either<Failure, List<FolderEntity>>> getAllMaterials({required String courseId}) async{
    try{
      final List<FolderEntity>allMaterials=await materialDataSource.fetchAllMaterials(courseId:courseId );
      return right(allMaterials);
    }catch(error){
    if(error is DioException){
      return left(ServerFailure.fromDiorError(error));
    }else{
      return left(ServerFailure(error.toString()));
    }}
  }
  
  @override
  Future<Either<Failure,List<FileEntity>>> getAllMaterialsFiles({required lecId}) async{
    try{
      final List<FileEntity>allFiles=await materialDataSource.fetchAllMaterialFiles(lecId:lecId);
      return right(allFiles);
    }catch(error){
    if(error is DioException){
      return left(ServerFailure.fromDiorError(error));
    }else{
      return left(ServerFailure(error.toString()));
    }}
  }
  
  @override
  Future<Either<Failure, void>>updateMaterial({
    required String url})async {
     try{
      final response= await materialDataSource.updateMaterial(
      url: url
    );
    return right(response);
    }catch(error){
      if(error is DioException){
        return left(ServerFailure.fromDiorError(error));
      }else{
        return left(ServerFailure(error.toString()));
      }
    }
  }
  
  @override
  Future<Either<Failure, void>> deleteMaterial({required String url})async {
     try{
      final response= await materialDataSource.deleteMaterial(
      url: url
    );
    return right(response);
    }catch(error){
      if(error is DioException){
        return left(ServerFailure.fromDiorError(error));
      }else{
        return left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> addMaterial({String? folderName, File ?file,required String type,

   required bool isFolder, required String url})async {
     try{
      final response= await materialDataSource.addMaterial(
      url: url, 
      isFolder: isFolder,
      folderName: folderName,
      type: type,
      file: file
    );
    return right(response);
    }catch(error){
      if(error is DioException){
        return left(ServerFailure.fromDiorError(error));
      }else{
        return left(ServerFailure(error.toString()));
      }
    }
  }
}