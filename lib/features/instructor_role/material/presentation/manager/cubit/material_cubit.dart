import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/constants/constant.dart';
import 'package:universityhup/core/functions/open_file.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_file_entity.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_folder_entity.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/material_files_usecase.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/material_usecase.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/update_material_use_case.dart';
part 'material_state.dart';

class InsMaterialCubit extends Cubit<MaterialsState> {
 
  InsMaterialCubit({required this.materialUseCase,required this.fileUseCase,required this.updateMaterialUseCase}) : super(MaterialInitial());
  static InsMaterialCubit get(context) => BlocProvider.of(context);
  final InsMaterialUseCase materialUseCase; 
  final InsMaterialFilesUseCase fileUseCase; 
  final UpdateMaterialUseCase updateMaterialUseCase; 

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
        emit(GetAllFilesSuccessState(files: allFiles));},
       );
  }
 
  int tapBarIndex = 0;
  void changeTabBar({required int index,}) {
    tapBarIndex = index;
    emit(ChangeTapBarState());
  }
 void openFile({required String filePath}){
  downloadAndOpenFile(filePath);
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
        (r) => emit(UpdateMaterialSuccessState(),), 
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
        (right) => emit(UpdateMaterialSuccessState(),), 
      );
  }
}
