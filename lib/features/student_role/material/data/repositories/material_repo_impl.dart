
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/student_role/material/data/data_sources/material_local_data_source.dart';
import 'package:universityhup/features/student_role/material/data/data_sources/material_remote_data_source.dart';

import '../../domain/entities/material_folder_entity.dart';
import '../../domain/repositories/material_repo.dart';

class MaterialRepository extends MaterialRepo{
  final MaterialRemoteDataSourceImpl materialDataSource;
  final FoldersLocalDataSource foldersLocalDataSource;
  MaterialRepository({required this.foldersLocalDataSource,required this.materialDataSource});

  @override
  Future<Either<Failure, List<FolderEntity>>> getAllMaterials({required String courseId}) async{
        List<FolderEntity>localFolders=[];

    try{
      final List<FolderEntity>allMaterials=await materialDataSource.fetchAllMaterials(courseId:courseId );
      foldersLocalDataSource.fetchCoursesFromHive();
      if(allMaterials.isEmpty){
        localFolders=foldersLocalDataSource.fetchCoursesFromHive();
        return right(localFolders);
      }
      return right(allMaterials);
    }catch(error){
    if(error is DioException){
          if(ServerFailure.fromDiorError(error).message =='No Internet Connection'&&localFolders.isNotEmpty){
           localFolders= foldersLocalDataSource.fetchCoursesFromHive();
            return right(localFolders);
          }
      return left(ServerFailure.fromDiorError(error));
    }else{
      return left(ServerFailure(error.toString()));
    }}
  }
}