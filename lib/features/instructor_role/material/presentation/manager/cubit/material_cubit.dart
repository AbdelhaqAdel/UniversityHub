import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/constants/constant.dart';
import 'package:universityhup/core/functions/open_file.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_file_entity.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_folder_entity.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/add_material_use_case.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/delete_material_use_case.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/material_files_usecase.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/material_usecase.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/update_material_use_case.dart';
part 'material_state.dart';

class InsMaterialCubit extends Cubit<MaterialsState> {
 
  InsMaterialCubit({required this.materialUseCase,required this.fileUseCase,required this.updateMaterialUseCase,
  required this.deleteMaterialUseCase ,required this.addMaterialUseCase
  }) : super(MaterialInitial());
  static InsMaterialCubit get(context) => BlocProvider.of(context);
  final InsMaterialUseCase materialUseCase; 
  final InsMaterialFilesUseCase fileUseCase; 
  final UpdateMaterialUseCase updateMaterialUseCase; 
  final DeleteMaterialUseCase deleteMaterialUseCase;
    final AddMaterialUseCase addMaterialUseCase;

String? folderId;
  Future<void>fetchAllMaterials()async{
    emit(GetAllMaterialsLoadingState());
    final result=await materialUseCase.call(currentCycleId);
    result.fold(
       (error)=>emit(GetAllMaterialsErrorState(error:error.message )),
       (materials){
        GetAllMaterialsSuccessState.setCourseMaterials(lectures:materials['lectures'],labs:  materials['labs']);
        emit(GetAllMaterialsSuccessState());},
       );
  }

 Future<void>fetchMaterialFiles({required String lecId})async{
    emit(GetAllFilesLoadingState());
    final result=await fileUseCase.call(lecId);
    result.fold(
       (error)=>emit(GetAllFilesErrorState(error:error.message )),
       (allFiles){
        GetAllFilesSuccessState.setFilesList(files:allFiles);
        folderId=lecId;
        emit(GetAllFilesSuccessState(files: allFiles));},
       );
  }
 
  int tapBarIndex = 0;
  void changeTabBar({required int index,}) {
    tapBarIndex = index;
    emit(ChangeTapBarState());
  }
 
 Future<void> updateFolderName({
    required String folderId,
    required String newFolderName,
  }) async {
    emit(UpdateMaterialLoadingState());
     final result= await updateMaterialUseCase.call(
        'FolderName?name=$newFolderName&lectureId=$folderId'
      );
      result.fold((error) => emit(UpdateMaterialErrorState(error: error.toString()),),
        (r) {
                    fetchAllMaterials();
          emit(UpdateMaterialSuccessState(),);} 
      );
  }

  Future<void> updateFileName({
    required int fileId,
    required String newFileName,
  }) async {
    print('File id ::: $fileId');
    emit(UpdateMaterialLoadingState());
     final result= await updateMaterialUseCase.call(
        'file?file_Id=$fileId&fileName=$newFileName'
      );
      result.fold((error) => emit(UpdateMaterialErrorState(error: error.toString()),),
        (right) {

           emit(UpdateMaterialSuccessState(),);} 
      );
  }

 Future<void> deleteFolder({
    required String folderId,
  }) async {
    emit(DeleteMaterialLoadingState());
     final result= await deleteMaterialUseCase.call(
        'Folder?lectureId=$folderId'
      );
      result.fold((error) => emit(DeleteMaterialErrorState(error: error.toString()),),
        (r) {
                    fetchAllMaterials();
           emit(DeleteMaterialSuccessState(),);} 
      );
  }

    Future<void> deleteFile({
    required int fileId,
  }) async {
    print('File id ::: $fileId');
    emit(DeleteMaterialLoadingState());
     final result= await deleteMaterialUseCase.call(
        'File?FileId=$fileId'
      );
      result.fold((error) => emit(DeleteMaterialErrorState(error: error.toString()),),
        (right) { 
          emit(DeleteMaterialSuccessState(),);} 
      );
  }


 
 Future<void> addFolder({
    required String folderName,
  }) async {
    emit(AddMaterialLoadingState());
     final result= await addMaterialUseCase.call(
      url: 'Instructor/UploadLectureFolder',
      isFolder: true,
      folderName: folderName,
      );
      result.fold((error) => emit(AddMaterialErrorState(error: error.toString()),),
        (r) {
             fetchAllMaterials();
           emit(AddMaterialSuccessState(),);} 
      );
  }

 Future<void> addFile() async {
    emit(AddMaterialLoadingState());
     final result= await addMaterialUseCase.call(
      url: 'Instructor/UploadLectureFile?lectureId=$folderId&file_Name=${pickedFile?.path.split('/').last}', 
      isFolder: true,
      file: pickedFile,
      );
      result.fold((error) => emit(AddMaterialErrorState(error: error.toString()),),
        (r) {
             fetchAllMaterials();
           emit(AddMaterialSuccessState(),);} 
      );
  }

  File? pickedFile;
  void pickMaterialFile()async{
     await pickFile().then((files){
       pickedFile=files[0];
       
     });
  }




}
