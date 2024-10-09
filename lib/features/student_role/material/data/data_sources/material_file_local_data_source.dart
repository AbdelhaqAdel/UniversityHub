import 'package:hive/hive.dart';
import 'package:universityhup/core/constants/hive_constants.dart';
import 'package:universityhup/features/student_role/material/domain/entities/material_file_entity.dart';
import 'package:universityhup/features/student_role/material/domain/entities/material_folder_entity.dart';

abstract class FilesLocalDataSource {
  List<FileEntity> fetchFilesFromHive({required folderId});
}
class MaterialFileLocalDataSourceImpl extends FilesLocalDataSource{
  @override
  List<FileEntity> fetchFilesFromHive({required folderId})  {
  List<FileEntity>allFiles=[];
  var box= Hive.box<List<FolderEntity>>(HiveConstants.materialBox);
  allFiles= (box.get(folderId, defaultValue: []) as List).cast<FileEntity>();
    return allFiles;
  }
}