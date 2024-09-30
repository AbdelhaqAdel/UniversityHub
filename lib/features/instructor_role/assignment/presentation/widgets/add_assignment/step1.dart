
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/widgets/glass_box.dart';

import '../../../../../../core/widgets/custom_text_form_field.dart';


class Step1Content extends StatelessWidget {
  const Step1Content({
    super.key,
    required this.taskNameController,
  });

  final TextEditingController taskNameController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        children: [
          GlassBox(
            widget: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.center,
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 3.0, horizontal: 8),
                    child: Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'name of task which students can see it.',
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight:
                              FontWeight.w500,
                            ),
                          ),
                        ),
                        // SizedBox(width: 60,),
                        // Icon(Icons.add_chart,size: 30,),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(
                          horizontal: 8.0),
                      child:   CustomTextFormField(
                        controller: taskNameController,
                        keyboardType: TextInputType.text,
                        hintText: 'Task Name',
                        prefixIcon:  FontAwesomeIcons.solidPenToSquare,
                        obscureText: false,
                        suffix: const SizedBox(),
                        borderRadius: 18,
                        withBorder: false,height: 60,),
                    ),
                  ),
                ],
              ),
            ),
            color: Colors.white.withOpacity(.2),
            borderRadius: 20,
            x: 0,
            y: 0, border: true,),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
