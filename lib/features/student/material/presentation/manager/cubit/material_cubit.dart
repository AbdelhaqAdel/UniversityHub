import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/student/material/domain/entities/material_folder_entity.dart';
import 'package:universityhup/features/student/material/domain/use_cases/material_usecase.dart';
part 'material_state.dart';

class MaterialCubit extends Cubit<MaterialsState> {
 
  MaterialCubit({required this.materialUsecase,}) : super(MaterialInitial());
  static MaterialCubit get(context) => BlocProvider.of(context);
  final MaterialUsecase materialUsecase; 

  Future<void>fetchAllMaterials()async{
    emit(GetAllMaterialsLoadingState());

    final resault=await materialUsecase.call();
    resault.fold(
       (error)=>emit(GetAllMaterialsErrorState(error:error.message )),
       (materials){
        emit(GetAllMaterialsSuccessState(lectures: materials['lectures'],labs: materials['labs']));},
       );
  }


  int tapBarIndex = 0;

  void changeTabBar({required int index,}) {
    tapBarIndex = index;
    emit(ChangeTapBarState());
  }

  //   Future<void>fetchQuizData()async{
  //   emit(GetAllQuizDataLoadingState());
  //   final resault=await quizDataUseCase.call();
  //   resault.fold(
  //      (error)=>emit(GetAllQuizDataErrorState(error:error.message )),
  //      (quizzes){
  //       GetAllQuizDataSuccessState.setCourseName(answers: allquizAnswers);
  //       emit(GetAllQuizDataSuccessState(quizzes: quizzes));
  //       },

  //      );
  // }


}
