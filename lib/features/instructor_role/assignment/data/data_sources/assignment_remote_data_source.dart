
import '../../../../../core/constants/constant.dart';
import '../../../../../core/utils/api_service.dart';
import '../../domain/entities/assignment_entity.dart';
import '../models/assignment_info_model.dart';
import '../models/assignment_model.dart';
import '../models/submit_assignment_input.dart';

abstract class AssignmentRemoteDataSource {
  Future<List<AssignmentEntity>> getAssignment();
  Future<AssignmentInfoModel?> getAssignmentInfo({required String assignmentId});
  Future submitAssignment({required SubmitAssignmentInputModel submitAssignmentInputModel});
}

class AssignmentRemoteDataSourceImpl extends AssignmentRemoteDataSource {
  @override
  Future<List<AssignmentEntity>> getAssignment() async {
    List<AssignmentEntity> assignmentEntityList = [];
    await DioHelper.get(
      url: 'Students/CurrentCoursesTasks?CycleId=$currentCycleId',
      token: token,
    ).then((value) async {
      if (value.statusCode == 200) {
        var json = value.data;
         assignmentEntityList= setAssignmentData(json);
      }
    });
    return assignmentEntityList;
  }

  List<AssignmentEntity> setAssignmentData(
      List<dynamic> json) {
    List<AssignmentEntity> assignmentEntityList = [];
    for (var element in json) {
      assignmentEntityList.add(AssignmentModel.fromJson(element));
    }
    return assignmentEntityList;
  }


  @override
  Future submitAssignment({required SubmitAssignmentInputModel submitAssignmentInputModel}) async{

    await DioHelper.postListFileData(
        url: 'Students/File/Upload?taskid=${submitAssignmentInputModel.taskId}',
        files: submitAssignmentInputModel.file)
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
