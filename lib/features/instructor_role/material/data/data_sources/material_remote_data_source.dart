import 'package:dio/dio.dart';
import 'package:universityhup/core/constants/constant.dart';
import 'package:universityhup/core/utils/api_service.dart';
import 'package:universityhup/core/utils/end_point.dart';

import '../../domain/entities/material_folder_entity.dart';
import '../models/material_folder_model.dart';

abstract class MaterialRemoteDataSource{
  Future<List<FolderEntity>>fetchAllMaterials({required String courseId});
}
class MaterialRemoteDataSourceImpl extends MaterialRemoteDataSource{
  List<FolderEntity>allMaterials=[];
  
  @override
  Future<List<FolderEntity>> fetchAllMaterials({required String courseId})async {
    await DioHelper.get(url:'${EndPoint.allMaterials}$courseId',
    token:token
     ).then((value){
      fillMateriaMap(value);
    });
    return allMaterials;
  }
 void fillMateriaMap(Response<dynamic> list) {
  allMaterials=[];
     for (var element in list.data) {
      allMaterials.add(FolderModel.fromJson(element));
    }
  }
  
}
