
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/instructor_role/material/data/data_sources/material_remote_data_source.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_folder_entity.dart';
import 'package:universityhup/features/instructor_role/material/domain/repositories/material_repo.dart';

class MaterialRepository extends MaterialRepo{
  final MaterialRemoteDataSourceImpl materialDataSource;
  MaterialRepository({required this.materialDataSource});

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
}