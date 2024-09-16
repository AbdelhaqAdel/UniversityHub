import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/material_file_entity.dart';
import '../../../domain/entities/material_folder_entity.dart';
import '../../../domain/use_cases/material_files_usecase.dart';
import '../../../domain/use_cases/material_usecase.dart';
part 'material_state.dart';

class MaterialCubit extends Cubit<MaterialsState> {
 
  MaterialCubit({required this.materialUsecase,required this.fileUsecase}) : super(MaterialInitial());
  static MaterialCubit get(context) => BlocProvider.of(context);
  final MaterialUsecase materialUsecase; 
  final MaterialFilesUsecase fileUsecase; 

  Future<void>fetchAllMaterials()async{
    emit(GetAllMaterialsLoadingState());
    final resault=await materialUsecase.call();
    resault.fold(
       (error)=>emit(GetAllMaterialsErrorState(error:error.message )),
       (materials){
        emit(GetAllMaterialsSuccessState(lectures: materials['lectures'],labs: materials['labs']));},
       );
  }

 Future<void>fetchMaterialFiles()async{
    emit(GetAllFilesLoadingState());

    final resault=await fileUsecase.call();
    resault.fold(
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

}
