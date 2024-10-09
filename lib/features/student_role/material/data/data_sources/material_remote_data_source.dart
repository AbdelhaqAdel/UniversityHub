import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:universityhup/core/constants/constant.dart';
import 'package:universityhup/core/constants/hive_constants.dart';
import 'package:universityhup/core/functions/hive_function.dart';
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
    try{
    await DioHelper.get(url:'${EndPoint.allMaterials}$courseId',
    token:token
     ).then((value){
      fillMateriaMap(value);
    // HiveService.clear<FolderEntity>(HiveConstants.materialFilesBox);
      HiveService.saveMap<FolderEntity>(key: currentCycleId??'noId', value: allMaterials,boxName: HiveConstants.materialBox);
    });
   return allMaterials;
    }catch(e){
    List<FolderEntity>localCourses=(Hive.box<List<FolderEntity>>(HiveConstants.materialBox).get(currentCycleId??'noId', defaultValue: []) as List).cast<FolderEntity>();
    return localCourses;
    }
  }

 void fillMateriaMap(Response<dynamic> list) {
  allMaterials=[];
     for (var element in list.data) {
      allMaterials.add(FolderModel.fromJson(element));
    }
    // allMaterials.forEach((e){print(e.lectureName);});
  }
  
}
