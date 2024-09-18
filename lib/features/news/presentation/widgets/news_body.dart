import 'package:flutter/material.dart';
import '../../../../../core/functions/app_bar.dart';
import 'news_listview.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 30,),
        CustomTitle(),
        PostListview(),


      ],
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: [
        Text(
          'News & events !',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: 23,),

          // TextStyle(
          //   fontWeight: FontWeight.w700,
          //   fontSize: 25,
          //   color: Colors.black,
          // ),
        ),
        Text(
          'Time Line Here.',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}




