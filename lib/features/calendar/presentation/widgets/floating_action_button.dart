import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/style/colors.dart';
import 'package:universityhup/core/widgets/custom_button.dart';
import 'package:universityhup/core/widgets/glass_box.dart';
import 'package:universityhup/features/calendar/presentation/manager/calender_cubit.dart';
import 'package:universityhup/features/calendar/presentation/manager/calender_state.dart';
import 'package:universityhup/features/calendar/presentation/widgets/add_event_form.dart';
import 'package:universityhup/features/calendar/presentation/widgets/select_date_buttons.dart';

// ignore: must_be_immutable
class CustomFloatingAction extends StatelessWidget {
  CustomFloatingAction({super.key});

  final Time time = Time(hour: 11, minute: 30, second: 0);

  @override
  Widget build(BuildContext context) {
    TextEditingController eventBodyController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var screenSize = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height / 11, horizontal: 8),
      child: FloatingActionButton(
        backgroundColor: KColors.buttonColor,
        onPressed: () {
          showDialog<String>(
            context: context,
            barrierColor: Colors.black.withOpacity(.3),
            useSafeArea: true,
            builder: (BuildContext dialogContext) => BlocProvider.value(
              value: BlocProvider.of<CalendarCubit>(context),
               child: BlocConsumer<CalendarCubit, CalendarState>(
                listener: (context, state) {
                  if (state is AddEventSuccessState) {
                    Navigator.pop(context);
                    CalendarCubit.get(context).getDayEvents();
                  }
                },
                builder: (context, state) {
                  return AlertDialog(
                    insetPadding: const EdgeInsets.all(0.0),
                    scrollable: false,
                    shadowColor: Colors.transparent,
                    content: Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: GlassBox(
                            border: false,
                            widget: Stack(
                              children: [
                                Column(
                                  children: [
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: GlassBox(
                                        border: true,
                                        widget: SizedBox(
                                          height: MediaQuery.of(context).size.height / 2.5,
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Form(
                                              key: formKey,
                                              child: Column(
                                                children: [
                                                  const Spacer(),
                                                  AddEventForm(
                                                    eventBodyController: eventBodyController,
                                                  ),
                                                  SizedBox(height: screenSize.height * 0.02),
                                                  SelectDateButtons(
                                                    focusDay: ChangeCalenderDayState.thisFocusDay,
                                                    time: time,
                                                  ),
                                                  SizedBox(height: screenSize.height * 0.02),
                                                  CustomButton(
                                                    onTap: () async{
                                                      if (formKey.currentState!.validate()) {
                                                        CalendarCubit.get(context).addEvent(
                                                          start: CalendarCubit.get(context).startDate!,
                                                          end: CalendarCubit.get(context).endDate!,
                                                          event: eventBodyController.text,
                                                          context: context
                                                        );
                                                      }
                                                    },
                                                    height: screenSize.height / 17,
                                                    color: KColors.buttonColor,
                                                    fontSize: 20.sp,
                                                    text: 'Add',
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        color: Colors.white.withOpacity(.5),
                                        borderRadius: 20.sp,
                                        x: 15,
                                        y: 15,
                                      ),
                                    ),
                                    const Spacer(flex: 1),
                                  ],
                                ),
                              ],
                            ),
                            color: Colors.transparent,
                            borderRadius: 0,
                            x: 3,
                            y: 3,
                          ),
                        ),
                      ),
                    ),
                    elevation: 0,
                    clipBehavior: Clip.none,
                    surfaceTintColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    contentPadding: EdgeInsets.zero,
                  );
                },
              ),
            ),
          );
        },
        child: const FaIcon(
          FontAwesomeIcons.plus,
          color: KColors.secondaryColor,
        ),
      ),
    );
  }
}
