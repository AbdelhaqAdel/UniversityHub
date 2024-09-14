import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/style/colors.dart';
import 'package:universityhup/core/widgets/glass_box.dart';

class ScreenPath extends StatelessWidget {
  const ScreenPath({super.key});

  @override
  Widget build(BuildContext context) {
    return    
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: GlassBox(
                            widget: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                   FaIcon(
                                    FontAwesomeIcons.folderOpen,
                                    color: KColors.c1Color.withOpacity(.9),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Material',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: KColors.c1Color,
                                    ),
                                  ),
                                  const Spacer(),
                                  FaIcon(
                                    FontAwesomeIcons.angleRight,
                                    color: KColors.c1Color.withOpacity(.9),
                                  ),
                                  const Spacer(),
                                  FaIcon(
                                    FontAwesomeIcons.solidUser,
                                    color: KColors.c1Color.withOpacity(.9),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Instructor',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: KColors.c1Color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            color: KColors.subTitleColor.withOpacity(.15),
                            borderRadius: 15,
                            x: 0,
                            y: 0,
                            border: false,
                        ),
                      );
  }
}