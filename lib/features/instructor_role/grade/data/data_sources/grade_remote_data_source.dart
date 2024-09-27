import 'dart:io';

import '../../../../../core/constants/constant.dart';
import '../../../../../core/utils/api_service.dart';
import '../../domain/entities/grade_entity.dart';
import '../models/grade_model.dart';


abstract class GradeRemoteDataSource {
  Future<List<GradeEntity>> getGrade();
}

class GradeRemoteDataSourceImpl extends GradeRemoteDataSource {
  @override
  Future<List<GradeEntity>> getGrade() async {
    List<GradeEntity> gradeEntityList = [];
    await DioHelper.get(
      url: 'Students/GetAllGradesForCurrentCourse?courseId=$currentCycleId',
      token: token,
    ).then((value) async {
      if (value.statusCode == 200) {
        print(currentCycleId);
        var json = value.data;
        gradeEntityList= setGradeData(json);
      }
    });
    return gradeEntityList;
  }


    List<GradeEntity> setGradeData(
      List<dynamic> json) {
    List<GradeEntity> gradeEntityList = [];
    for (var element in json) {
      gradeEntityList.add(GradeModel.fromJson(element));
    }
    return gradeEntityList;
  }
}
