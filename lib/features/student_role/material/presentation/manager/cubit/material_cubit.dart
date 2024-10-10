import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/constants/constant.dart';
import 'package:universityhup/features/student_role/material/data/repositories/material_files_repo_impl.dart';
import '../../../domain/entities/material_file_entity.dart';
import '../../../domain/entities/material_folder_entity.dart';
import '../../../domain/use_cases/material_files_usecase.dart';
import '../../../domain/use_cases/material_usecase.dart';
part 'material_state.dart';

class MaterialCubit extends Cubit<MaterialsState> {
 
  MaterialCubit({required this.materialUseCase,required this.fileUseCase,required this.fileRepo}) : super(MaterialInitial());
  static MaterialCubit get(context) => BlocProvider.of(context);
  final MaterialUseCase materialUseCase; 
  final MaterialFilesUseCase fileUseCase; 
  final MaterialFilesRepository fileRepo;
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


}
