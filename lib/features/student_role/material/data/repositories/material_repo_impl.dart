
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/features/student_role/material/data/data_sources/material_remote_datasource.dart';

import '../../domain/entities/material_folder_entity.dart';
import '../../domain/repositories/material_repo.dart';

class MaterialRepository extends MaterialRepo{
  final MaterialRemoteDatasourceImpl materialDataSource;
  MaterialRepository({required this.materialDataSource});

  @override
  Future<Either<Failure, Map<String,List<FolderEntity>>>> getAllMaterials() async{
    try{
      final Map<String, List<FolderEntity>>allMaterials=await materialDataSource.fetchAllMaterials();
      return right(allMaterials);
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