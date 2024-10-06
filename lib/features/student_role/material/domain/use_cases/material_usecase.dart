import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/core/use_cases/use_case.dart';

import '../../data/repositories/material_repo_impl.dart';
import '../entities/material_folder_entity.dart';

class MaterialUseCase extends UseCase<Map<String,List<FolderEntity>>,String>{
   MaterialUseCase({required this.materialRepo});
   final MaterialRepository materialRepo;
   Map<String,List<FolderEntity>>allMaterials={};
  @override
  Future<Either<Failure, Map<String,List<FolderEntity>>>> call([String? param]) async{
    final response=await materialRepo.getAllMaterials(courseId: param!);
    response.fold((error){
      return Left(error);
    },(allMaterials){
     filterMaterialsIntoMap(allMaterials);
    });
    print('-------------------------------');
    print(allMaterials.keys);
    print('-------------------------------');

    return Right(allMaterials);
  }


void filterMaterialsIntoMap(List<FolderEntity> list) {
    List<FolderEntity>lectures=[];
  List<FolderEntity>labs=[];
     for (FolderEntity element in list) {
      if(element.type=='Lecture'){
      lectures.add(element);
      } else{
       labs.add(element);
      }
    }
    allMaterials={"lectures":lectures,"labs":labs};
   // allMaterials.addAll({"lectures":lectures,"labs":labs});
  }
}


