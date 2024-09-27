import '../../../../../core/constants/constant.dart';
import '../../../../../core/utils/api_service.dart';
import '../../domain/entities/assignment_entity.dart';
import '../models/add_assignment_input.dart';
import '../models/assignment_info_model.dart';
import '../models/assignment_model.dart';
import '../models/set_grade_assignment_input.dart';
import '../models/update_assignment_input.dart';

abstract class AssignmentInstructorRemoteDataSource {
  Future<List<AssignmentInstructorEntity>> getAssignmentInstructor();
  Future updateAssignment(
      {required UpdateAssignmentInstructorInputModel
          updateAssignmentInstructorInputModel});
  Future setGradeAssignment(
      {required SetGradeAssignmentInputModel setGradeAssignmentInputModel});
  Future addAssignment(
      {required AddAssignmentInputModel addAssignmentInputModel});
  Future deleteAssignment({required String assignmentId});
}

class AssignmentInstructorRemoteDataSourceImpl
    extends AssignmentInstructorRemoteDataSource {
  @override
  Future<List<AssignmentInstructorEntity>> getAssignmentInstructor() async {
    List<AssignmentInstructorEntity> assignmentEntityList = [];
    await DioHelper.get(
      url: 'Instructor/GetCurrentCourseTasks?CycleId=$currentCycleId',
      token: token,
    ).then((value) async {
      if (value.statusCode == 200) {
        var json = value.data;
        assignmentEntityList = setAssignmentInstructorData(json);
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
  Future updateAssignment(
      {required UpdateAssignmentInstructorInputModel
          updateAssignmentInstructorInputModel}) async {
    await DioHelper.updateData(
            url:
                'Instructor/UpdateAnAssignment?taskId=${updateAssignmentInstructorInputModel.taskId}',
            token: token,
            data: updateAssignmentInstructorInputModel.toMap())
        .then((value) {});
  }

  @override
  Future deleteAssignment({required String assignmentId}) async {
    await DioHelper.deleteData(
      url: 'Instructor/DeleteAnAssignment?taskId=$assignmentId',
      token: token,
    );
  }

  @override
  Future setGradeAssignment(
      {required SetGradeAssignmentInputModel
          setGradeAssignmentInputModel}) async {
    await DioHelper.updateData(
      url:
          'Instructor/editStudentGrade?studentId=${setGradeAssignmentInputModel.studentId}&examId=${setGradeAssignmentInputModel.taskId}&grade=${setGradeAssignmentInputModel.grade}',
      token: token,
    );
  }

  @override
  Future addAssignment({required AddAssignmentInputModel addAssignmentInputModel}) async{
    DioHelper.postListFileData(
      url: 'Instructor/UploadAssignment?TaskName=${addAssignmentInputModel.taskName}&TaskGrade=${addAssignmentInputModel.taskGrade}&StartDate=${addAssignmentInputModel.startDate}&EndDate=${addAssignmentInputModel.endDate}&CourseCycleId=$currentCycleId',
      files:addAssignmentInputModel.file ,
    );
  }
}
