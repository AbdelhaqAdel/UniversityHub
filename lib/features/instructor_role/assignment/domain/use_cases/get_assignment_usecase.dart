import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../entities/assignment_entity.dart';
import '../repositories/assignment_repo.dart';

class GetAssignmentInstructorUseCase extends UseCase<
    ({
    List<AssignmentInstructorEntity> assignmentEntityCompleteList,
    List<AssignmentInstructorEntity> assignmentEntityPendingList
    }),
    NoParam> {
 final AssignmentInstructorRepo assignmentRepo;

 GetAssignmentInstructorUseCase({required this.assignmentRepo});

 @override
 Future<
     Either<
         Failure,
         ({
         List<AssignmentInstructorEntity> assignmentEntityCompleteList,
         List<AssignmentInstructorEntity> assignmentEntityPendingList
         })>> call([NoParam? param]) async {
  final result = await assignmentRepo.getAssignmentInstructor();
  return result.fold(
       (failure) => Left(failure),
       (assignmentEntityList) {
    var filteredData = filterAssignmentInstructorData(assignmentEntityList);
    return Right(filteredData);
   },
  );
 }

 ({
 List<AssignmentInstructorEntity> assignmentEntityPendingList,
 List<AssignmentInstructorEntity> assignmentEntityCompleteList
 }) filterAssignmentInstructorData(List<AssignmentInstructorEntity> assignmentEntityList) {
  List<AssignmentInstructorEntity> assignmentEntityCompleteList = [];
  List<AssignmentInstructorEntity> assignmentEntityPendingList = [];
  for (var element in assignmentEntityList) {
   if (DateTime.now().isBefore(DateTime.parse(element.endDate!))) {
    assignmentEntityPendingList.add(element);
   } else {
    assignmentEntityCompleteList.add(element);
   }
  }
  return (
  assignmentEntityPendingList: assignmentEntityPendingList,
  assignmentEntityCompleteList: assignmentEntityCompleteList
  );
 }
}
