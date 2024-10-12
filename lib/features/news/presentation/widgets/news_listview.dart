import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/dashboard_data.dart';
import '../../domain/entities/news_entity.dart';
import '../manager/news_cubit.dart';
import '../manager/news_state.dart';
import 'news_Item.dart';

class PostListview extends StatefulWidget {
  const PostListview({super.key});

  @override
  State<PostListview> createState() => _PostListviewState();
}

class _PostListviewState extends State<PostListview> {
  List<NewsEntity> newsEntity = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        if (state is GetNewsSuccessState) {
          newsEntity = state.newsEntity;
        }
      },
      builder: (context, state) {
        if (newsEntity.isNotEmpty) {
          return Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 100,top: 30),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>  NewsItem(
                      caption:caption[index],
                      image:image[index],
                      isImage:isImage[index],
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                itemCount: 6),
          );
        } else {
          return const Expanded(
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
