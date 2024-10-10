import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/style/colors.dart';
import 'package:universityhup/core/widgets/glass_box.dart';
import 'package:universityhup/features/instructor_role/material/presentation/manager/cubit/material_cubit.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/file%20widgets/add_file_button_builder.dart';

class FileCustomFloatingAction extends StatefulWidget {
  const FileCustomFloatingAction({
    super.key,
    required this.onTap,
    required this.formKey,
  });
  final Function onTap;
  final GlobalKey<FormState> formKey;

  @override
  State<FileCustomFloatingAction> createState() => _FileCustomFloatingActionState();
}

class _FileCustomFloatingActionState extends State<FileCustomFloatingAction> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: FloatingActionButton(
        backgroundColor: KColors.buttonColor,
        onPressed: () {
          showDialog<String>(
            context: context,
            barrierColor: Colors.black.withOpacity(.3),
            useSafeArea: true,
            builder: (BuildContext dialogContext) {
              return BlocProvider.value(
                value: BlocProvider.of<InsMaterialCubit>(context),
                child: BlocConsumer<InsMaterialCubit, MaterialsState>(
                  listener: (context, state) {
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
                                            height: MediaQuery.of(context).size.height / 3.5,
                                            child: Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Form(
                                                key: widget.formKey,
                                                child: Column(
                                                  children: [
                                                    const Spacer(),
                                                    AddFileButtonBuilder(onTap: widget.onTap),
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
              );
            },
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
