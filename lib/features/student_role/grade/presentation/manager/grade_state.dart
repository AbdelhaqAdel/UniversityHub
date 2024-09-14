
import '../../domain/entities/grade_entity.dart';

sealed class GradeState {}

final class GradeInitial extends GradeState {}

class GetGradeLoadingState extends GradeState{}
class GetGradeSuccessState extends GradeState{
  final List<GradeEntity>  gradeEntity;
  GetGradeSuccessState({required this.gradeEntity});
}
class GetGradeErrorState extends GradeState{
  final String errMessage;
  GetGradeErrorState(this.errMessage);
}
