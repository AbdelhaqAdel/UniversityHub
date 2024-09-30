import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:universityhup/core/functions/custom_snack_bar.dart';
import 'package:universityhup/core/widgets/app_bar.dart';
import 'package:universityhup/core/widgets/glass_box.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/add_assignment/end_date.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/add_assignment/start_date.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/add_assignment/step1.dart';
import 'package:universityhup/features/instructor_role/assignment/presentation/widgets/add_assignment/step3_content.dart';
import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../data/models/add_assignment_input.dart';
import '../../manager/assignment_cubit.dart';
import 'controls_builder.dart';

class AddAssignmentBody extends StatefulWidget {
  const AddAssignmentBody({super.key});

  @override
  State<AddAssignmentBody> createState() => _AddAssignmentBodyState();
}

class _AddAssignmentBodyState extends State<AddAssignmentBody> {
  int _index = 0;
  var taskNameController = TextEditingController();
  var taskGradeController = TextEditingController();
  var stepController = ScrollController();
  var addTaskFormKey = GlobalKey<FormState>();
  String? startDate =
      DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").format(DateTime.now());
  String? endDate =
      DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AssignmentInstructorCubit, AssignmentInstructorState>(
      listener: (context, state) {
        if(state is AddAssignmentSuccessState){
          showSnackBar(context: context, message: 'Task Created');
          // GoRouter.of(context).go(AppRouter.kAssignmentInstructorScreen);
          GoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              DefaultAppBar(context: context),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Form(
                  key: addTaskFormKey,
                  child: Stepper(
                    currentStep: _index,
                    type: StepperType.vertical,
                    connectorColor: WidgetStateProperty.all(Colors.blue),
                    physics: const BouncingScrollPhysics(),
                    elevation: 0,
                    connectorThickness: 3,
                    controller: stepController,
                    controlsBuilder: (context, details) =>
                        ControlsBuilder(details: details),
                    onStepCancel: () {
                      if (_index > 0) {
                        setState(() {
                          _index -= 1;
                        });
                      }
                    },
                    onStepContinue: () {
                      onStepContinue(context);
                    },
                    onStepTapped: (int index) {
                      setState(() {
                        _index = index;
                      });
                    },
                    steps: [
                      Step(
                        isActive: _index >= 0,
                        state: _index >= 0
                            ? StepState.complete
                            : StepState.disabled,
                        title: const Text(
                          'Title and Description',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w800),
                        ),
                        content: Step1Content(
                            taskNameController: taskNameController),
                      ),
                      Step(
                        isActive: _index >= 1,
                        state: _index >= 1
                            ? StepState.complete
                            : StepState.disabled,
                        title: const Text(
                          'Timing and points',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w800),
                        ),
                        content: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GlassBox(
                                      widget: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Expanded(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.0),
                                                child: Text(
                                                  'What about points ?',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            SizedBox(
                                              height: 70,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: CustomTextFormField(
                                                  controller:
                                                      taskGradeController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  hintText: 'Points',
                                                  prefixIcon: FontAwesomeIcons
                                                      .solidPenToSquare,
                                                  obscureText: false,
                                                  suffix: const SizedBox(),
                                                  borderRadius: 18,
                                                  withBorder: false,
                                                  height: 60,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      color: Colors.white.withOpacity(.2),
                                      borderRadius: 20,
                                      x: 0,
                                      y: 0,
                                      border: true,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 0,
                              ),
                              SizedBox(
                                height: 200,
                                child: GlassBox(
                                  widget: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Determine Time',
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 60,
                                          child: GestureDetector(
                                            onTap: () async {
                                              startDate =
                                                  await AssignmentInstructorCubit
                                                          .get(context)
                                                      .pickDateTime(
                                                          context: context);
                                            },
                                            child: StartDate(
                                                startData:
                                                    DateTime.parse(startDate!)),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 60,
                                          child: GestureDetector(
                                            onTap: () async {
                                              endDate =
                                                  await AssignmentInstructorCubit
                                                          .get(context)
                                                      .pickDateTime(
                                                          context: context);
                                            },
                                            child: EndDate(
                                                endDate:
                                                    DateTime.parse(endDate!)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  color: Colors.white.withOpacity(.2),
                                  borderRadius: 20,
                                  x: 0,
                                  y: 0,
                                  border: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Step(
                        isActive: _index == 2,
                        state: _index == 2
                            ? StepState.complete
                            : StepState.disabled,
                        title: const Text(
                          'Upload assignment',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w800),
                        ),
                        content: Step3Content(
                            taskNameController: taskNameController,
                            taskGradeController: taskGradeController,
                            endDate: endDate,
                            startDate: startDate),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void onStepContinue(BuildContext context) {
     if (_index == 2) {
      if (addTaskFormKey.currentState!.validate() &&
          AssignmentInstructorCubit.get(context)
              .file
              .isNotEmpty) {
        AddAssignmentInputModel addAssignmentInputModel =
            AddAssignmentInputModel(
                taskName: taskNameController.text,
                taskGrade: taskGradeController.text,
                startDate: startDate,
                endDate: endDate,
                file:AssignmentInstructorCubit.get(context).file);
        AssignmentInstructorCubit.get(context).addAssignment(
            addAssignmentInputModel: addAssignmentInputModel);
      } else {
        showSnackBar(
            message: 'please add all data about task',
            context: context);
      }
    } else if (_index <= 0 || _index < 2) {
      setState(() {
        _index += 1;
      });
    }
  }
}
