
import '../../../../../core/constants/constant.dart';
import '../../../../../core/utils/api_service.dart';
import '../../domain/entities/news_entity.dart';
import '../models/news_model.dart';


abstract class NewsRemoteDataSource {
  Future<List<NewsEntity>> getNews();
}

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  @override
  Future<List<NewsEntity>> getNews() async {
    List<NewsEntity> newsEntityList = [];
    await DioHelper.get(
      url: 'https://lms.runasp.net/api/News',
      token: token,
    ).then((value) async {
      if (value.statusCode == 200) {
        var json = value.data;
        newsEntityList= setNewsData(json);
      }
    });
    return newsEntityList;
  }


    List<NewsEntity> setNewsData(
      List<dynamic> json) {
    List<NewsEntity> newsEntityList = [];
    for (var element in json) {
      newsEntityList.add(NewsModel.fromJson(element));
    }
    return newsEntityList;
  }
}
