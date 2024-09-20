import 'package:dartz/dartz.dart';
import 'package:universityhup/features/student_role/assignment/domain/entities/assignment_entity.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../repositories/assignment_repo.dart';

class GetAssignmentUseCase extends UseCase<
    ({
    List<AssignmentEntity> assignmentEntityCompleteList,
    List<AssignmentEntity> assignmentEntityPendingList
    }),
    NoParam> {
 final AssignmentRepo assignmentRepo;

 GetAssignmentUseCase({required this.assignmentRepo});

 @override
 Future<
     Either<
         Failure,
         ({
         List<AssignmentEntity> assignmentEntityCompleteList,
         List<AssignmentEntity> assignmentEntityPendingList
         })>> call([NoParam? param]) async {
  final result = await assignmentRepo.getAssignment();
  return result.fold(
       (failure) => Left(failure),
       (assignmentEntityList) {
    var filteredData = filterAssignmentData(assignmentEntityList);
    return Right(filteredData);
   },
  );
 }

 ({
 List<AssignmentEntity> assignmentEntityPendingList,
 List<AssignmentEntity> assignmentEntityCompleteList
 }) filterAssignmentData(List<AssignmentEntity> assignmentEntityList) {
  List<AssignmentEntity> assignmentEntityCompleteList = [];
  List<AssignmentEntity> assignmentEntityPendingList = [];
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
