import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';

import '../utils/api_service.dart';

void openFile({required String networkFile}) async {
  var dir = await getExternalStorageDirectory();
  String filePath = "${dir?.path}/${networkFile.split('/').last}";
  print(' ---------------');
  print('filePath');
  print(filePath);
  print(' ---------------');


 await OpenFile.open(filePath).then((value) {
    print(' ---------------');
    print('open file success');
    print(' ---------------');
    if (value.message == 'the $filePath file does not exist') {
      print(' ---------------');
      print('if open file success');
      print(' ---------------');
      loadPDF(networkFile: networkFile);
    }
  }).catchError((error) {
    loadPDF(networkFile: networkFile);
    print(' ---------------');
    print('open file fun catch error $error');
    print(' ---------------');
  });
}


// Function to load the PDF from the network
Future<void> loadPDF({required String networkFile}) async {
  var dir = await getExternalStorageDirectory();
  String filePath = "${dir?.path}/${networkFile.split('/').last}";
  // Download file using Dio
  try {
    await DioHelperForFiles.downloadFile( networkFilePath: networkFile, localFilePath: filePath).then((onValue)async{
      print(' ---------------');
      print('downloadFile');
      print(' ---------------');
     await OpenFile.open(filePath);
      // openFile(networkFile: filePath);
    });

  } catch (error) {
    print(' ---------------');
    print('loadPDF file fun catch error  $error');
    print(' ---------------');
  }
}

List<PlatformFile> pickedFileList = [];
// Function to pick a file using FilePicker
void pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowMultiple: false,
    allowedExtensions: ['png', 'cdr', 'psd', 'jpeg', 'pdf'],
  );

  if (result != null) {
    pickedFileList = result.files;
    print('Files picked: ${pickedFileList.length}');
  } else {
    print('File picking cancelled.');
  }
}

// // Another file picker function for picking assignment files
// List<File> all_assign_files_List = [];
//
// void pick_File() async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//     type: FileType.custom,
//     allowMultiple: false,
//     allowedExtensions: ['png', 'cdr', 'psd', 'jpeg', 'jpg', 'pdf'],
//   );
//
//   if (result != null) {
//     result.files.forEach((element) {
//       all_assign_files_List.add(File(element.path!));
//     });
//     print('Assignment files picked: ${all_assign_files_List.length}');
//   } else {
//     print('File picking cancelled.');
//   }
// }
