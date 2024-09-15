import 'package:dio/dio.dart';
import 'package:universityhup/core/utils/api_service.dart';
import 'package:universityhup/core/utils/end_point.dart';
import 'package:universityhup/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:universityhup/features/student/material/data/models/material_folder_model.dart';
import 'package:universityhup/features/student/material/domain/entities/material_folder_entity.dart';

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
    token:'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJhYmR1bG1hamVlZHNhbGxhbSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6IkFiZHVsTWFqZWVkU2FsbGFtQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlN0dWRlbnQiLCJleHAiOjE3MjY0NDk5NDIsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcyODYiLCJhdWQiOiJNeVNlY3VyZWRBcGlVc2VycyJ9.Cf5Pdz__V_pXqeB61t3s7PHTbwcQre5Y6__hrqf7bYE'
    // LoginSuccessState.loginEntity?.token
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
       print(element.lectureName);
   });
  }
  
}
