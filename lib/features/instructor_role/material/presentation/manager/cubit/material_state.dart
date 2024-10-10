part of 'material_cubit.dart';

sealed class MaterialsState {}

final class MaterialInitial extends MaterialsState {}

class GetAllMaterialsLoadingState extends MaterialsState {}

class GetAllMaterialsSuccessState extends MaterialsState {

  static List<FolderEntity> allLectures=[];
  static List<FolderEntity> allLabs=[];
  static void setCourseMaterials({required lectures,required labs}){
    allLectures=lectures;
    allLabs=labs;  
  }
  GetAllMaterialsSuccessState();
}
class GetAllMaterialsErrorState extends MaterialsState {
  final String error;
  GetAllMaterialsErrorState({required this.error});
}

class ChangeTapBarState extends MaterialsState {}

class GetAllFilesLoadingState extends MaterialsState {}

class GetAllFilesSuccessState extends MaterialsState {
  static List<FileEntity> allFiles=[];
  static void setFilesList({required  List<FileEntity> files}){
    allFiles=files;
  }
 final List<FileEntity> files;
  GetAllFilesSuccessState({required this.files});
}
class GetAllFilesErrorState extends MaterialsState {
  final String error;
  GetAllFilesErrorState({required this.error});
}


class UpdateMaterialLoadingState extends MaterialsState {}

class UpdateMaterialSuccessState extends MaterialsState {}

class UpdateMaterialErrorState extends MaterialsState {
    final String error;
  UpdateMaterialErrorState({required this.error});
}

class DeleteMaterialLoadingState extends MaterialsState {}

class DeleteMaterialSuccessState extends MaterialsState {}

class DeleteMaterialErrorState extends MaterialsState {
    final String error;
  DeleteMaterialErrorState({required this.error});
}


class AddMaterialLoadingState extends MaterialsState {}

class AddMaterialSuccessState extends MaterialsState {}

class AddMaterialErrorState extends MaterialsState {
    final String error;
  AddMaterialErrorState({required this.error});
}

class PickFileSuccessState extends MaterialsState {}


