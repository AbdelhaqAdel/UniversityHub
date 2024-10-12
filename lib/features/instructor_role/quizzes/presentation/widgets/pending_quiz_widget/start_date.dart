

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/style/textStyles.dart';

class StartDate extends StatelessWidget {
  const StartDate({
    super.key, required this.startData,
  });
  final DateTime? startData;




  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.teal.withOpacity(.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const FaIcon(FontAwesomeIcons.clock),
            const SizedBox(
              width: 7,
            ),
            Text(
              'Start',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black.withOpacity(.7),
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(.3),
              ),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width* .17,

                  child: Text(
                   '${startData!.hour} : ${startData!.minute}',
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle16black
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(.3),
              ),
              child:  Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width* .17,
                  child: Text(
                    '${startData!.day} / ${startData!.month}',
                      textAlign: TextAlign.center,

                      maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:Styles.textStyle16black
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
