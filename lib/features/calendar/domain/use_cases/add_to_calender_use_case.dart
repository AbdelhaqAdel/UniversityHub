import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/core/use_cases/use_case.dart';
import 'package:universityhup/features/calendar/domain/repositories/calender_repo.dart';

class AddEventToCalendarUseCase extends UseCase<String,String> {
  final CalendarRepository repository;

  AddEventToCalendarUseCase(this.repository);
  @override
  Future<Either<Failure, String>> call([String? param, String? start,String?end]) {
    return repository.addEventToCalendar(startDate:start!, endDate: end!, eventBody: param!);
  }
}