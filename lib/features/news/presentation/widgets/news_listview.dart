import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/custom_snack_bar.dart';
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
        if(state is GetNewsSuccessState){
          showSnackBar(context: context, message: 'GetNewsSuccessState');
          newsEntity=state.newsEntity;
        }
      },
      builder: (context, state) {
        if(newsEntity.isNotEmpty ){
          return Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) =>  NewsItem(newsEntity:newsEntity[index],),
                separatorBuilder: (context, index) =>
                const SizedBox(
                  height: 5,
                ),
                itemCount: newsEntity.length),
          );

        }else{
          return const Expanded(child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}