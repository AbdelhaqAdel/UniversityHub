import 'package:hive/hive.dart';
import 'package:universityhup/core/constants/constant.dart';
import 'package:universityhup/core/constants/hive_constants.dart';
import 'package:universityhup/features/student_role/material/domain/entities/material_folder_entity.dart';

abstract class FoldersLocalDataSource {
  List<FolderEntity> fetchCoursesFromHive();
}
class FoldersLocalDataSourceImpl extends FoldersLocalDataSource{
  @override
  List<FolderEntity> fetchCoursesFromHive()  {
  List<FolderEntity>allFolders=[];
  var box= Hive.box<List<FolderEntity>>(HiveConstants.materialBox);
  allFolders= (box.get(currentCycleId??'noId', defaultValue: []) as List).cast<FolderEntity>();
    return allFolders;
  }
}