import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universityhup/features/student_role/assignment/domain/entities/assignment_entity.dart';
import '../../../../../core/utils/api_service.dart';
import '../../domain/entities/assignment_info_entity.dart';
import '../../domain/use_cases/get_assignment_info_usecase.dart';
import '../../domain/use_cases/get_assignment_usecase.dart';
import '../../domain/use_cases/submit_assignment_usecase.dart';
part 'assignment_state.dart';

class AssignmentCubit extends Cubit<AssignmentState> {
  AssignmentCubit(
      {required this.getAssignmentUseCase,
      required this.getAssignmentInfoUseCase,
      required this.submitAssignmentUseCase})
      : super(AssignmentInitial());

  final GetAssignmentUseCase getAssignmentUseCase;
  final GetAssignmentInfoUseCase getAssignmentInfoUseCase;
  final SubmitAssignmentUseCase submitAssignmentUseCase;



  void getAssignment() async {
    emit(GetAssignmentLoadingState());
    var result = await getAssignmentUseCase.call();
    result.fold((failure) {
      emit(GetAssignmentErrorState(failure.toString()));
    }, (right) {
      GetAssignmentSuccessState.completedAssignmentEntity=right.assignmentEntityCompleteList;
      GetAssignmentSuccessState.pendingAssignmentEntity=right.assignmentEntityPendingList;

      emit(GetAssignmentSuccessState());
    });
  }

  void getAssignmentInfo({required String assignmentId}) async {
    emit(GetAssignmentInfoLoadingState());
    var result = await getAssignmentInfoUseCase.call(assignmentId);
    result.fold((failure) {
      emit(GetAssignmentInfoErrorState(failure.toString()));
    }, (right) {
      emit(GetAssignmentInfoSuccessState(assignmentInfoEntity: right));
    });
  }

  void submitAssignment({required String assignmentId}) async {
    emit(SubmitAssignmentLoadingState());
    var result = await submitAssignmentUseCase.call(assignmentId);
    result.fold((failure) {
      emit(SubmitAssignmentErrorState(failure.toString()));
    }, (right) {
      emit(SubmitAssignmentSuccessState());
    });
  }









  void openFile_Fun({File? file, String? filePath, networkFile}) async {
    //  if(filePath!=''){
    var dir = await getExternalStorageDirectory();
    print(dir);
    String testFilePath = "${dir?.path}/${networkFile
        .split('/')
        .last}";
    print('file path : ${testFilePath}  ----');
    print('file path : ${filePath}  ******');

    OpenFile.open(testFilePath,).then((value) {
      print(value.message);
      if (value.message == 'the $testFilePath file does not exists'
          ) {
        loadPDF(networkfile: networkFile);
      }

    }).catchError((error) {
      loadPDF(networkfile: networkFile);
      print('opening file error${error}');
    });

    // pathPDF='';
  }


//   static Future<void> openURL(String url) async {
//     final Uri _url = Uri.parse(url);
//
//     print('ss $_url');
// print(url);
//    // bool iscanLaunchUrl = await canLaunchUrl(_url);
//
//     //if (iscanLaunchUrl) {
//       print('ssdd $_url');
//       await launchUrl(_url).then((value) {
//         print('success');
//       }).catchError((error){
//         print('ddddddddddddddddddddd');
//         print(error);
//         print('Could not launch $url');
//       });
//   //  } else {
//
//  //   }
//   }

  // Future<bool> isFileInExternalStorage(String filePath) async {
  //   // Get the external storage directory
  //   final Directory? externalStorageDir = await getExternalStorageDirectory();
  //   if (externalStorageDir == null) {
  //     print('Error: Unable to access external storage directory');
  //     return false;
  //   }
  //
  //   // Get the directory where the file is located
  //   final Directory fileDir = Directory(filePath).parent;
  //
  //   // Check if the file directory is the same as the external storage directory
  //   return fileDir.path == externalStorageDir.path;
  // }

  String pathPDF = "";

  Future<void> loadPDF({
    required networkfile,
  }) async {
    var dir = await getExternalStorageDirectory();
    print(dir);
    String filePath = "${dir?.path}/${networkfile
        .split('/')
        .last}";
    print('--------------------from cubit:$networkfile');
    // Download file using Dio
    // openFile_Fun(filePath: filePath);
    DioHelperForFiles.downloadFile(
        networkFilePath: networkfile,
        localFilePath: filePath).then((value) {
      //print('dddd${value.data}');
      pathPDF = filePath;
      openFile_Fun(networkFile: filePath);
    }).catchError((error) {
    });
  }



}

