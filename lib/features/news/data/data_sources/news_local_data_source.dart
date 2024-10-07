import 'package:hive/hive.dart';
import 'package:universityhup/core/constants/hive_constants.dart';

import '../../domain/entities/news_entity.dart';

abstract class NewsLocalDataSource {
  List<NewsEntity> getNews();
}

class NewsLocalDataSourceImpl extends NewsLocalDataSource {
  @override
  List<NewsEntity> getNews() {
    List<NewsEntity> newsEntity = [];
    var box = Hive.box<NewsEntity>(HiveConstants.kNewsBox);
    newsEntity = box.values.toList();
    return newsEntity;
  }
}
