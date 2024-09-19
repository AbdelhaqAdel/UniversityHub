
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universityhup/core/constants/hive_constants.dart';
import 'package:universityhup/features/courses/data/models/all_courses_model.dart';

abstract class MaterialFileLocalDataSource {
  Future<List<CoursesModel>> fetchCoursesFromHive();
  Future<String> getFilePath({File? file, String? filePath, required String networkFile});
}
class MaterialFileLocalDataSourceImpl extends MaterialFileLocalDataSource{
  @override
  Future<List<CoursesModel>> fetchCoursesFromHive() async {
  var box= Hive.box<CoursesModel>(HiveConstants.coursesBox);
  print('getting cached data');
     return box.values.toList();
  }

  @override
   Future<String> getFilePath({File? file, String? filePath, required String networkFile}) async {
    var dir = await getExternalStorageDirectory();
    if (dir == null) {
      throw Exception('External storage directory not found');
    }
    String filePath = "${dir.path}/${networkFile.split('/').last}";
    return filePath;
}
}