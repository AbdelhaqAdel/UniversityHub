import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/functions/setup_service_locator.dart';
import 'package:universityhup/features/calendar/domain/use_cases/add_to_calender_use_case.dart';
import 'package:universityhup/features/calendar/domain/use_cases/get_calender_use_case.dart';
import 'package:universityhup/features/calendar/presentation/manager/calender_cubit.dart';
import 'package:universityhup/features/calendar/presentation/manager/calender_state.dart';
import 'package:universityhup/features/calendar/presentation/widgets/calendar_builder.dart';
import 'package:universityhup/features/calendar/presentation/widgets/calendar_table.dart';
import 'package:universityhup/features/calendar/presentation/widgets/floating_action_button.dart';

class CalendarBody extends StatefulWidget {
  const CalendarBody({Key? key}) : super(key: key);

  @override
  _CalendarBodyState createState() => _CalendarBodyState();
}

class _CalendarBodyState extends State<CalendarBody> {
  final GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey();
  var eventBodyController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarCubit(
        getEventsUseCase: getIt.get<GetCalendarDayEventsUseCase>(),
        addEventUseCase: getIt.get<AddEventToCalendarUseCase>(),
      )..getDayEvents(),
      child: BlocConsumer<CalendarCubit, CalendarState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.transparent,
            floatingActionButton: CustomFloatingAction(),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Column(
                  children: [
                    CalendarTable(),
                    const Expanded(child: CalendarBuilder()),
                     SizedBox(height: MediaQuery.of(context).size.height / 15),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
