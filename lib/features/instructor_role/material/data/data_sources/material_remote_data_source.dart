import 'package:dio/dio.dart';
import 'package:universityhup/core/constants/constant.dart';
import 'package:universityhup/core/utils/api_service.dart';
import 'package:universityhup/core/utils/end_point.dart';
import 'package:universityhup/features/instructor_role/material/data/models/material_folder_model.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_folder_entity.dart';


abstract class InsMaterialRemoteDataSource{
  Future<List<FolderEntity>>fetchAllMaterials({required String courseId});
  Future<void> updateMaterial({
   required String url,
  });
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
    allMaterials.forEach((e){
      print(e.lectureName);
    });
  }

   @override
  Future<void> updateMaterial({
    required String url,
  }) async {
    print(url);
    await DioHelper.updateData(
      url:'Instructor/UpdateLecture$url',
      token: token
    ).then((v){print('updated successfully');
    // return v;
    }).catchError((e){
      print('error in update material ${e.toString()}');
    });
  }
  
}
