import 'package:hive/hive.dart';
import 'package:universityhup/core/constants/constant.dart';
import 'package:universityhup/core/constants/hive_constants.dart';
import 'package:universityhup/core/functions/hive_function.dart';
import 'package:universityhup/features/student_role/material/domain/entities/material_folder_entity.dart';

abstract class FoldersLocalDataSource {
  List<FolderEntity> fetchCoursesFromHive();
}
class FoldersLocalDataSourceImpl extends FoldersLocalDataSource{
  @override
  // List<FolderEntity> fetchCoursesFromHive()  {
  // List<FolderEntity>allFolders=[];
  // allFolders= HiveService.fetchMap(boxName:HiveConstants.materialBox,key:currentCycleId!,);
  // // var box= Hive.box<List<FolderEntity>>(HiveConstants.materialBox);
  // // print('------------------------------${box.get(currentCycleId??'noId', defaultValue: []).runtimeType}');
  // // allFolders= (box.get(currentCycleId??'noId', defaultValue: []) as List).cast<FolderEntity>();


  //   return allFolders;
  // }
   List<FolderEntity> fetchCoursesFromHive() {
  var box = Hive.box<List<FolderEntity>>(HiveConstants.materialBox);
  
  List<FolderEntity>? folders = box.get(currentCycleId, defaultValue: <FolderEntity>[]);

  return folders??[];
}
}