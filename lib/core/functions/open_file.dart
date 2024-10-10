import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:universityhup/core/functions/custom_snack_bar.dart';
import '../utils/api_service.dart';



Future<void> downloadAndOpenFile(String url) async {
  try {
    var dir = await getExternalStorageDirectory();
    String fileName = url.split('/').last;
    String filePath = "${dir?.path}/$fileName";
    await DioHelperForFiles.dio.download(url, filePath);
    OpenFile.open(filePath);
  } catch (error) {
    print('Error: $error');
  }
}



Future<List<File>> pickFile() async {
  List<File> pickedFile = [];
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowMultiple: false,
    allowedExtensions: ['png', 'cdr', 'psd', 'jpeg', 'pdf'],
  );
  if (result != null) {
    for (var element in result.files) {
      pickedFile.add(File(element.path!));
    }
    return pickedFile;
  }
  return pickedFile;

}


Future<void> downloadNewFileOrOpen(String url,context) async {
  try {      

    var dir = await getExternalStorageDirectory();
    String fileName = url.split('/').last;
    String filePath = "${dir?.path}/$fileName";

    File file = File(filePath);
    if (await file.exists()) {
      OpenFile.open(filePath);
    } else {
      showSnackBar(context: context, message: 'start download file');
      await DioHelperForFiles.dio.download(url, filePath);
      OpenFile.open(filePath);
    }
  } catch (error) {
    showSnackBar(context: context, message: 'File not found');
    print('Error: $error');
  }
}




