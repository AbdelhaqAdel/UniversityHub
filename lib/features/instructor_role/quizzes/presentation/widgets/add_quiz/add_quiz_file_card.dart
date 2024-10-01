


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/widgets/glass_box.dart';

class AddQuizFileCard extends StatelessWidget {
  const AddQuizFileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassBox(
      widget: Container(
        height: 150,
        width: 150,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey
                        .withOpacity(.3),
                    borderRadius:
                    BorderRadius.circular(
                        12),
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.plus,
                    size: 35,
                    color: Colors.black,
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .center,
                children: [
                  Icon(
                    Icons
                        .file_present_rounded,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Attach File', //: 'Done',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight:
                      FontWeight.bold,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      color: Colors.white.withOpacity(.2),
      borderRadius: 20,
      x: 0,
      y: 0, border: true,);
  }
}
