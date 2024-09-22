import 'package:dio/dio.dart';
import 'package:universityhup/core/constants/constant.dart';
import 'package:universityhup/core/utils/api_service.dart';
import 'package:universityhup/core/utils/end_point.dart';
import 'package:universityhup/features/student_role/material/data/models/material_file_model.dart';

import '../../domain/entities/material_file_entity.dart';

abstract class MaterialFileRemoteDataSource{
  Future <List<FileEntity>>fetchAllMaterialFiles({required lecId});
}

class MaterialFileRemoteDataSourceImpl extends MaterialFileRemoteDataSource{
  List<FileEntity>allFiles=[];
  @override
   Future <List<FileEntity>> fetchAllMaterialFiles({required lecId})async {
    await DioHelper.get(url:'${EndPoint.allMaterialFiles}$lecId',
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

}
