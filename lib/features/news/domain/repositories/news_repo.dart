import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/news_entity.dart';


abstract class NewsRepo{
  Future<Either<Failure,List<NewsEntity>>>  getNews();
}