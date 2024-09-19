import 'package:dio/dio.dart';
import 'package:universityhup/core/constants/constant.dart';
import 'package:universityhup/core/utils/api_service.dart';
import 'package:universityhup/core/utils/end_point.dart';

import '../../domain/entities/material_folder_entity.dart';
import '../models/material_folder_model.dart';

abstract class MaterialRmoteDataSourse{
  Future <Map<String,List<FolderEntity>>>fetchAllMaterials();
}
class MaterialRemoteDatasourceImpl extends MaterialRmoteDataSourse{
  List<FolderEntity>lectures=[];
  List<FolderEntity>labs=[];
  Map<String,List<FolderEntity>>allMaterials={};
  
  @override
  Future <Map<String,List<FolderEntity>>> fetchAllMaterials()async {
    await DioHelper.get(url:EndPoint.allMaterials,
    token:token
     ).then((value){
      fillMateriaMap(value);
    });
    return allMaterials;
  }
 void fillMateriaMap(Response<dynamic> list) {
    List<FolderEntity>lectures=[];
  List<FolderEntity>labs=[];
  allMaterials={};
     for (var element in list.data) {
      if(element['type']=='Lecture'){
      lectures.add(FolderModel.fromJson(element));
      } else{
       labs.add(FolderModel.fromJson(element));
      }
    }
   allMaterials.addAll({"lectures":lectures,"labs":labs});
   allMaterials['lectures']?.forEach((element) {
   });
  }
  
}
