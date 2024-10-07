import 'package:flutter/material.dart';

import '../../domain/entities/news_entity.dart';

class NewsHeader extends StatelessWidget {
  const NewsHeader({
    super.key,
    required this.newsEntity,
  });

  final NewsEntity newsEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          Container(
            decoration:
            const BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 2,
                spreadRadius: 2,
              ),
            ]),
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blue,
              backgroundImage:
              AssetImage('assets/images/avatar1.png'),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${newsEntity.userName}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                    // TextStyle(
                    //   fontWeight: FontWeight.w900,
                    //   fontSize:20,
                    //   color: Colors.black,
                    // ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.verified,
                    size: 18,
                    color: Colors.black.withOpacity(.5),
                  ),
                ],
              ),
              Text(
                '${DateTime.parse(newsEntity.createdAt!).year}-${DateTime.parse(newsEntity.createdAt!).month}'
                    '-${DateTime.parse(newsEntity.createdAt!).day} at '
                    '${DateTime.parse(newsEntity.createdAt!).hour}:${DateTime.parse(newsEntity.createdAt!).minute}',
                // '${news?.createdAt}',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                  color: Colors.black.withOpacity(.6),
                ),
              ),
            ],
          ),
          const Spacer(),
          // IconButton(
          //     onPressed: () {},
          //     icon: FaIcon(
          //       FontAwesomeIcons.ellipsisVertical,
          //       color: Colors.black,
          //     )),
        ],
      ),
    );
  }
}
