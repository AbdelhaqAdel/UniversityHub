part of 'material_cubit.dart';

sealed class MaterialsState {}

final class MaterialInitial extends MaterialsState {}

class GetAllMaterialsLoadingState extends MaterialsState {}

class GetAllMaterialsSuccessState extends MaterialsState {

  static String currentFolderId='';
  static void setFolderId({required folderId}){
    currentFolderId=folderId;
  }
  final List<FolderEntity>? lectures;
  final List<FolderEntity>? labs;
  
  GetAllMaterialsSuccessState({this.labs,this.lectures});
}
class GetAllMaterialsErrorState extends MaterialsState {
  final String error;
  GetAllMaterialsErrorState({required this.error});
}

class ChangeTapBarState extends MaterialsState {}



// class GetAllQuizDataLoadingState extends MaterialState {}

// class GetAllQuizDataSuccessState extends MaterialState {
//   static List<String> quesAnswers=[];
//   static void setCourseName({required answers}){
//     answers=answers;
//   }
//  final List<Questions> quizzes;
//   GetAllQuizDataSuccessState({required this.quizzes});
// }
// class GetAllQuizDataErrorState extends MaterialState {
//   final String error;
//   GetAllQuizDataErrorState({required this.error});
// }

// class ChangeQuizAnswerState extends MaterialState{}