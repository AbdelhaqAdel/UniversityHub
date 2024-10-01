
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/widgets/glass_box.dart';

import '../../../../../../core/constants/constant.dart';
import '../../../../../../core/style/textStyles.dart';


class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.quizNameController,
    required this.quizGradeController,
    required this.endDate,required this.startDate,
  });

  final TextEditingController quizNameController;
  final TextEditingController quizGradeController;
  final DateTime? endDate;
  final DateTime? startDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: GlassBox(
        widget: Container(
          height: 160,
          decoration: BoxDecoration(
            // color: Colors.blueGrey.withOpacity(.05),
            borderRadius:
            BorderRadius.circular(20),
            border: Border.all(width: .5),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0,
                right: 15,
                bottom: 10,
                left: 15),
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                        '${quizNameController.text}'),
                    const Spacer(),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        // color: Colors.yellow.withOpacity(.9),
                        border: Border.all(
                          width: .8,
                          color: Colors.grey
                              .withOpacity(1),
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.pen,
                          size: 15,
                          color: Colors.grey
                              .withOpacity(1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        // color: Colors.red.withOpacity(.6),
                        border: Border.all(
                          width: .8,
                          color: Colors.grey
                              .withOpacity(1),
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons
                              .trashCan,
                          size: 15,
                          color: Colors.grey
                              .withOpacity(1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        // color: Colors.teal.withOpacity(.6),
                        border: Border.all(
                          width: .8,
                          color: Colors.grey
                              .withOpacity(1),
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.eye,
                          size: 15,
                          color: Colors.grey
                              .withOpacity(1),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  color: Colors.black
                      .withOpacity(.3),
                  height: .5,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding:
                          const EdgeInsets
                              .only(
                              left: 5.0),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .start,
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .center,
                            children: [
                              Row(
                                children: [
                                  const FaIcon(
                                    FontAwesomeIcons
                                        .bookmark,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Expanded(
                                    child: Text(
                                      currentCycleName!,
                                      textAlign:
                                      TextAlign
                                          .start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight:
                                          FontWeight
                                              .w700,
                                          fontSize:
                                          13),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  const FaIcon(
                                    FontAwesomeIcons
                                        .chartLine,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    '${quizGradeController.text} points',
                                    textAlign:
                                    TextAlign
                                        .start,
                                    style: const TextStyle(
                                        fontWeight:
                                        FontWeight
                                            .w700,
                                        fontSize:
                                        13),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  const FaIcon(
                                    FontAwesomeIcons
                                        .clock,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    'StartDate ${startDate!.hour} : ',
                                    style: Styles.textStyle12.copyWith(color: Colors.teal,fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    '${startDate!.minute}',
                                    style: Styles.textStyle12.copyWith(color: Colors.teal,fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  const FaIcon(
                                    FontAwesomeIcons
                                        .clock,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    'DeadLine ${endDate!.hour} : ',
                                    style: Styles.textStyle12.copyWith(color: Colors.red,fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    '${endDate!.minute}',
                                    style: Styles.textStyle12.copyWith(color: Colors.red,fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .center,
                          children: [
                            Container(
                              height: 45,
                              width:
                              double.infinity,
                              decoration:
                              BoxDecoration(
                                color: Colors.teal
                                    .withOpacity(
                                    .6),
                                borderRadius:
                                BorderRadius
                                    .circular(
                                    12),
                                // border: Border.all(width: .5),
                              ),
                              child: const Center(
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                      fontWeight:
                                      FontWeight
                                          .w700,
                                      fontSize:
                                      20,
                                      color: Colors
                                          .white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        color: Colors.white.withOpacity(.2),
        borderRadius: 20,
        x: 0,
        y: 0, border: true,),
    );
  }
}
