import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

final List<Widget> newsList = [
  Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        Expanded(
          child: ConditionalBuilder(
              condition: true,
              builder: (context) => Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0,
                            top: 15,
                            bottom: 15,
                            left: 10),
                        child: Text(
                          // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
                          'Congratulations, you have completed your registration ! Lets start your learning journey next.',

                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.black.withOpacity(1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              fallback: (context) => const SizedBox(
                height: 0,
              )),
        ),
        Expanded(
          child: ConditionalBuilder(
              condition: true,
              builder: (context) => Padding(
                padding: const EdgeInsets.only(
                    left: 0, right: 0.0, top: 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[100],
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/post/6.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              fallback: (context) => const SizedBox(
                height: 0,
              )),
        ),
      ],
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        Expanded(
          child: ConditionalBuilder(
              condition: true,
              builder: (context) => Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0,
                            top: 15,
                            bottom: 15,
                            left: 10),
                        child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.'
                              'Congratulations, you have completed your registration ! Lets start your learning journey next.',
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.black.withOpacity(1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              fallback: (context) => const SizedBox(
                height: 0,
              )),
        ),
        ConditionalBuilder(
            condition: false,
            builder: (context) => Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 0, right: 0.0, top: 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[100],
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/a44.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            fallback: (context) => const SizedBox(
              height: 0,
            )),
      ],
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        Expanded(
          child: ConditionalBuilder(
              condition: true,
              builder: (context) => Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0,
                            top: 15,
                            bottom: 15,
                            left: 10),
                        child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.'
                              'Congratulations, you have completed your registration ! Lets start your learning journey next.',
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.black.withOpacity(1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              fallback: (context) => const SizedBox(
                height: 0,
              )),
        ),
        ConditionalBuilder(
            condition: true,
            builder: (context) => Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 0, right: 0.0, top: 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[100],
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/post/7.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            fallback: (context) => const SizedBox(
              height: 0,
            )),
      ],
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        Expanded(
          child: ConditionalBuilder(
              condition: true,
              builder: (context) => Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0,
                            top: 15,
                            bottom: 15,
                            left: 10),
                        child: Text(
                          // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
                          'Congratulations, you have completed your registration ! Lets start your learning journey next.',

                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.black.withOpacity(1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              fallback: (context) => const SizedBox(
                height: 0,
              )),
        ),
        Expanded(
          child: ConditionalBuilder(
              condition: true,
              builder: (context) => Padding(
                padding: const EdgeInsets.only(
                    left: 0, right: 0.0, top: 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey.withOpacity(.15),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/g7.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              fallback: (context) => const SizedBox(
                height: 0,
              )),
        ),
      ],
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        Expanded(
          child: ConditionalBuilder(
              condition: true,
              builder: (context) => Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0,
                            top: 15,
                            bottom: 15,
                            left: 10),
                        child: Text(
                          // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
                          'Congratulations, you have completed your registration ! Lets start your learning journey next.',

                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.black.withOpacity(1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              fallback: (context) => const SizedBox(
                height: 0,
              )),
        ),
        Expanded(
          child: ConditionalBuilder(
              condition: true,
              builder: (context) => Padding(
                padding: const EdgeInsets.only(
                    left: 0, right: 0.0, top: 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurple[100],
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/post/1.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              fallback: (context) => const SizedBox(
                height: 0,
              )),
        ),
      ],
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        Expanded(
          child: ConditionalBuilder(
              condition: true,
              builder: (context) => Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0,
                            top: 15,
                            bottom: 15,
                            left: 10),
                        child: Text(
                          // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
                          'Congratulations, you have completed your registration ! Lets start your learning journey next.',

                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.black.withOpacity(1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              fallback: (context) => const SizedBox(
                height: 0,
              )),
        ),
        Expanded(
          child: ConditionalBuilder(
              condition: true,
              builder: (context) => Padding(
                padding: const EdgeInsets.only(
                    left: 0, right: 0.0, top: 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurple[100],
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/post/11.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              fallback: (context) => const SizedBox(
                height: 0,
              )),
        ),
      ],
    ),
  ),
];


class ActivityData {
  ActivityData(this.year, this.sales);

  final String year;
  final double sales;
}


final List<ActivityData> activityList = [
  ActivityData('Jan', 35),
  ActivityData('Feb', 25),
  ActivityData('Mar', 34),
  ActivityData('Apr', 25),
  ActivityData('May', 40),
];

class GreatData {
  GreatData(this.xData, this.yData);
  final String xData;
  final num yData;
  String? text;
}
final List<GreatData> greatDataList = [
  GreatData('A', 75),
  GreatData('B', 80),
  GreatData('C', 85),
  GreatData('D', 90),
];