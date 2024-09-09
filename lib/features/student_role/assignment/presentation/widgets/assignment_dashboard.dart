import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AssignmentDashboard extends StatelessWidget {
  const AssignmentDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        // height: 200,
        // width: double.infinity,
        decoration: BoxDecoration(
          gradient: const RadialGradient(
            radius: 1.1,
            center: Alignment.topRight,
            colors: [
              Colors.blue,
              Colors.indigo
              //HexColor('051875FF'),
            ],
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'You are a super warrior !',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 17),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Icon(
                          FontAwesomeIcons.check,
                          size: 14,
                          color: Colors.indigo,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Done 4 task today',
                        style: TextStyle(
                            color: Colors.grey[300], fontSize: 14,fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Icon(
                          FontAwesomeIcons.check,
                          size: 14,
                          color: Colors.indigo,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Done 10 task yesterday',
                        style: TextStyle(
                            color: Colors.grey[300], fontSize: 14,fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Icon(
                          FontAwesomeIcons.check,
                          size: 14,
                          color: Colors.indigo,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Done 100 task last month',
                        style: TextStyle(
                            color: Colors.grey[300], fontSize: 14,fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              //Spacer(),
              const Expanded(
                child: Image(
                  height: 120,
                  width: 120,
                  image: AssetImage('assets/images/R.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
