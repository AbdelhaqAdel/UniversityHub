
import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';
import '../../domain/entities/news_entity.dart';
import '../../domain/repositories/news_repo.dart';
import '../data_sources/news_local_data_source.dart';
import '../data_sources/news_remote_data_source.dart';

class NewsRepoImpl extends NewsRepo{
 final NewsRemoteDataSource newsRemoteDataSource;
 final NewsLocalDataSource newsLocalDataSource;


 NewsRepoImpl( {required this.newsRemoteDataSource,required this.newsLocalDataSource,});

  @override
  Future<Either<Failure, List<NewsEntity>>> getNews() async {
    try{
      List<NewsEntity> newsEntityList = [];
      newsEntityList = await newsRemoteDataSource.getNews();
      if(newsEntityList.isEmpty){
        newsEntityList =  newsLocalDataSource.getNews();
        return right(newsEntityList);
      }
       return right(newsEntityList);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }


  
}