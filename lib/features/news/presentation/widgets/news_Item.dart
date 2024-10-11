import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:universityhup/core/widgets/glass_box.dart';
import 'package:universityhup/features/news/domain/entities/news_entity.dart';

import 'news_header.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.caption, required this.image, required this.isImage});
  final String caption;
  final String image;
  final bool isImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: GlassBox(
          widget: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const NewsHeader(),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: .3,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  NewsContent(caption: caption),
                  NewsImage(image: image,isImage:isImage),
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


class NewsContent extends StatelessWidget {
  const NewsContent({
    super.key,
    required this.caption,
  });

  final String caption;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
        condition: true,
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Text(
                    caption,
                    // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
                    //'Congratulations, you have completed your registration ! Lets start your learning journey next.',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        fallback: (context) => const SizedBox(
          height: 0,
        ));
  }
}

class NewsImage extends StatelessWidget {
  const NewsImage({
    super.key,
    required this.image, required this.isImage,
  });

  final String image;
  final bool isImage;


  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
        condition: isImage,
        builder: (context) => Padding(
          padding: const EdgeInsets.only(
              left: 0, right: 0.0, top: 5),
          child: Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blueGrey.withOpacity(.2),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
                onError: (exception, stackTrace) => const SizedBox(),
              ),
            ),
          ),
        ),
        fallback: (context) => const SizedBox(
          height: 0,
        ));
  }
}

