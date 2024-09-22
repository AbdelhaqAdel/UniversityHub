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
  static List<String> quesAnswers=[];
  static void setCourseName({required answers}){
    answers=answers;
  }
 final List<FileEntity> files;
  GetAllFilesSuccessState({required this.files});
}
class GetAllFilesErrorState extends MaterialsState {
  final String error;
  GetAllFilesErrorState({required this.error});
}