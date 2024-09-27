
import '../../../../../core/constants/constant.dart';
import '../../../../../core/utils/api_service.dart';
import '../../domain/entities/assignment_entity.dart';
import '../models/assignment_info_model.dart';
import '../models/assignment_model.dart';
import '../models/submit_assignment_input.dart';

abstract class AssignmentInstructorRemoteDataSource {
  Future<List<AssignmentInstructorEntity>> getAssignmentInstructor();
  Future<AssignmentInstructorInfoModel?> getAssignmentInstructorInfo({required String assignmentId});
  Future submitAssignmentInstructor({required SubmitAssignmentInstructorInputModel submitAssignmentInstructorInputModel});
}

class AssignmentInstructorRemoteDataSourceImpl extends AssignmentInstructorRemoteDataSource {
  @override
  Future<List<AssignmentInstructorEntity>> getAssignmentInstructor() async {
    List<AssignmentInstructorEntity> assignmentEntityList = [];
    await DioHelper.get(
      url: 'Students/CurrentCoursesTasks?CycleId=$currentCycleId',
      token: token,
    ).then((value) async {
      if (value.statusCode == 200) {
        var json = value.data;
         assignmentEntityList= setAssignmentInstructorData(json);
      }
    });
    return assignmentEntityList;
  }

  List<AssignmentInstructorEntity> setAssignmentInstructorData(
      List<dynamic> json) {
    List<AssignmentInstructorEntity> assignmentEntityList = [];
    for (var element in json) {
      assignmentEntityList.add(AssignmentInstructorModel.fromJson(element));
    }
    return assignmentEntityList;
  }


  @override
  Future submitAssignmentInstructor({required SubmitAssignmentInstructorInputModel submitAssignmentInstructorInputModel}) async{

    await DioHelper.postListFileData(
        url: 'Students/File/Upload?taskid=${submitAssignmentInstructorInputModel.taskId}',
        files: submitAssignmentInstructorInputModel.file)
        .then((value) {
      if (value.statusCode == 200) {
        var json = value.data;
      }
    });
  }

  @override
  Future<AssignmentInstructorInfoModel?> getAssignmentInstructorInfo({required String assignmentId}) async{
    AssignmentInstructorInfoModel? assignmentInfoModel;
  await  DioHelper.get(
      url: 'Students/GetAssignmentInstructor?taskId=$assignmentId',
      token: token,
    ).then((value) {
      if (value.statusCode == 200) {
        var json=value.data;
        assignmentInfoModel = AssignmentInstructorInfoModel.fromJson(json);
      }
    });
  return assignmentInfoModel;
  }
}
