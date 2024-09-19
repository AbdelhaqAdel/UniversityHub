import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/setup_service_locator.dart';
import '../../domain/entities/news_entity.dart';
import '../../domain/repositories/news_repo.dart';
import '../../domain/use_cases/get_news_usecase.dart';
import '../manager/news_cubit.dart';
import '../manager/news_state.dart';
import '../widgets/news_body.dart';


class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsCubit(
              getNewsUseCase: GetNewsUseCase(
                newsRepo: getIt.get<NewsRepo>(),
              ),
            )..getNews(),
      child: const NewsBody(),
    );
  }
}
