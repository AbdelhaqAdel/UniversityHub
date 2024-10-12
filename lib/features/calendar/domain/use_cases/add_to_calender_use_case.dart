import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import 'package:universityhup/core/use_cases/use_case.dart';
import 'package:universityhup/features/calendar/domain/entities/calender_entity.dart';
import 'package:universityhup/features/calendar/domain/repositories/calender_repo.dart';

class AddEventToCalendarUseCase extends UseCase<String,CalendarEntity> {
  final CalendarRepository repository;

  AddEventToCalendarUseCase(this.repository);
  @override
  Future<Either<Failure, String>> call([CalendarEntity?param]) {
    return repository.addEventToCalendar(calendarEntity:param!);
  }
}