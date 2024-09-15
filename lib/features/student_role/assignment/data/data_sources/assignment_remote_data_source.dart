import 'dart:io';

import '../../../../../core/constants/constant.dart';
import '../../../../../core/utils/api_service.dart';
import '../../domain/entities/assignment_entity.dart';
import '../models/assignment_info_model.dart';
import '../models/assignment_model.dart';

abstract class AssignmentRemoteDataSource {
  Future<List<AssignmentEntity>> getAssignment();
  Future<AssignmentInfoModel?> getAssignmentInfo({required String assignmentId});
  Future submitAssignment({required String assignmentId});
}

class AssignmentRemoteDataSourceImpl extends AssignmentRemoteDataSource {
  @override
  Future<List<AssignmentEntity>> getAssignment() async {
    List<AssignmentEntity> assignmentEntityList = [];
    List<AssignmentEntity> assignmentEntityCompleteList = [];
    List<AssignmentEntity> assignmentEntityPendingList = [];

    await DioHelper.get(
      url: 'Students/CurrentCourseTasks?CycleId=$currentCycleId',
      token: token,
    ).then((value) async {
      if (value.statusCode == 200) {
        var json = value.data;
        var data= setAssignmentData(json, assignmentEntityList);
        assignmentEntityPendingList = data.assignmentEntityPendingList;
        assignmentEntityCompleteList = data.assignmentEntityCompleteList;
        // print('get course Assign true --');
        // for (var element in assignmentEntityPendingList) {
        //   print('Pending end date ------- ${element.startDate}');
        //   print('Pending end date ------- ${element.endDate}');
        // }
        // for (var element in assignmentEntityCompleteList) {
        //   print('Pending end date ------- ${element.startDate}');
        //   print('Completed end date ------- ${element.endDate}');
        // }
      }
    });
    return assignmentEntityList;
  }

  ({
    List<AssignmentEntity> assignmentEntityPendingList,
    List<AssignmentEntity> assignmentEntityCompleteList
  }) setAssignmentData(
      List<dynamic> json,
      List<AssignmentEntity> assignmentEntityList) {
    List<AssignmentEntity> assignmentEntityCompleteList = [];
    List<AssignmentEntity> assignmentEntityPendingList = [];
    for (var element in json) {
      assignmentEntityList.add(AssignmentModel.fromJson(element));
    }
    for (var element in assignmentEntityList) {
      if (DateTime.now().isBefore(DateTime.parse(element.endDate!))) {
        assignmentEntityPendingList.add(element);
      } else {
        assignmentEntityCompleteList.add(element);
      }
    }
    return (assignmentEntityPendingList:assignmentEntityPendingList,assignmentEntityCompleteList:assignmentEntityCompleteList);
  }


  @override
  Future submitAssignment({required String assignmentId}) async{
    List<File>?files;
    await DioHelper.postListFileData(
        token: token,
        url: 'Students/File/Upload?taskid=$assignmentId',
        files: files)
        .then((value) {
      if (value.statusCode == 200) {
        var json = value.data;
      }
    });
  }

  @override
  Future<AssignmentInfoModel?> getAssignmentInfo({required String assignmentId}) async{
    AssignmentInfoModel? assignmentInfoModel;
  await  DioHelper.get(
      url: 'Students/GetAssignment?taskId=$assignmentId',
      token: token,
    ).then((value) {
      if (value.statusCode == 200) {
        var json=value.data;
        assignmentInfoModel = AssignmentInfoModel.fromJson(json);
      }
    });
  return assignmentInfoModel;
  }
}
