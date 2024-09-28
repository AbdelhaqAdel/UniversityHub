import 'package:hive/hive.dart';
import 'package:universityhup/core/constants/hive_constants.dart';
import 'package:universityhup/features/instructor_role/material/domain/entities/material_folder_entity.dart';

abstract class InsMaterialFileLocalDataSource {
  Future<List<FolderEntity>> fetchCoursesFromHive();
}
class InsMaterialFileLocalDataSourceImpl extends InsMaterialFileLocalDataSource{
  @override
  Future<List<FolderEntity>> fetchCoursesFromHive() async {
  var box= Hive.box<FolderEntity>(HiveConstants.materialBox);
  print('getting cached data');
     return box.values.toList();
  }
}