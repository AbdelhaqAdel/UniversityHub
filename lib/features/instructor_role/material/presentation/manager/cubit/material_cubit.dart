import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/constants/constant.dart';
import 'package:universityhup/core/functions/open_file.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_file_entity.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_folder_entity.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/material_files_usecase.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/material_usecase.dart';
part 'material_state.dart';

class MaterialCubit extends Cubit<MaterialsState> {
 
  MaterialCubit({required this.materialUseCase,required this.fileUseCase,}) : super(MaterialInitial());
  static MaterialCubit get(context) => BlocProvider.of(context);
  final InsMaterialUseCase materialUseCase; 
  final InsMaterialFilesUseCase fileUseCase; 
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

}
