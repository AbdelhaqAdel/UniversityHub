import 'dart:io';

import 'package:dio/dio.dart';
import 'package:universityhup/core/constants/constant.dart';
import 'package:universityhup/core/utils/api_service.dart';
import 'package:universityhup/core/utils/end_point.dart';
import 'package:universityhup/features/instructor_role/material/data/models/material_file_model.dart';
import 'package:universityhup/features/instructor_role/material/data/models/material_folder_model.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_file_entity.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_folder_entity.dart';


abstract class InsMaterialRemoteDataSource{
  Future<List<FolderEntity>>fetchAllMaterials({required String courseId});

    Future <List<FileEntity>>fetchAllMaterialFiles({required lecId});

  Future<void> updateMaterial({required String url,});Future<void> deleteMaterial({required String url,});

     Future<void> addMaterial({String?folderName,required bool isFolder,File ?file,required String url,});
}
class InsMaterialRemoteDataSourceImpl extends InsMaterialRemoteDataSource{
  List<FolderEntity>allMaterials=[];
  
  @override
  Future<List<FolderEntity>> fetchAllMaterials({required String courseId})async {
    await DioHelper.get(url:'${EndPoint.insAllMaterials}$courseId',
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

 List<FileEntity>allFiles=[];
  @override
   Future <List<FileEntity>> fetchAllMaterialFiles({required lecId})async {
    await DioHelper.get(url:'${EndPoint.insAllMaterialFiles}$lecId',
    token:token,
     ).then((value){
      fillFilesList(value);
    });
    return allFiles;
  }
 void fillFilesList(Response<dynamic> list) {
  allFiles=[];
     for (var element in list.data) {
      allFiles.add(FileModel.fromJson(element));
    }
  }

   @override
  Future<void> updateMaterial({
    required String url,
  }) async {
    print(url);
    await DioHelper.put(
      url:'Instructor/UpdateLecture$url',
      token: token
    ).then((v){print('updated successfully');
    }).catchError((e){
      print('error in update material ${e.toString()}');
    });
  }

   @override
  Future<void> deleteMaterial({
    required String url,
  }) async {
    print(url);
    await DioHelper.deleteData(
      url:'Instructor/DeleteLecture$url',
      token: token
    ).then((v){print('deleted successfully');
    }).catchError((e){
      print('error in delete material ${e.toString()}');
    });
  }
  

    @override
  Future<void> addMaterial({
    String?folderName,  
    File ?file,
    required bool isFolder,
    required String url, 
    }) async{
      if(isFolder) {
        await DioHelper.post(
          url: url,
          token: token,
          data: {
            "title": folderName,
            "type": 'Lecture',
            "cycleId": currentCycleId
          }
      ).then((v){print('added successfully');
    }).catchError((e){
      print('error in add material ${e.toString()}');
    });

      }else{
        await DioHelper.uploadFile(
          url: url,
         file:file??File(''),
      ).then((v){print('added successfully');
    }).catchError((e){
      print('error in add material ${e.toString()}');
    });
      }
  }
  
}
