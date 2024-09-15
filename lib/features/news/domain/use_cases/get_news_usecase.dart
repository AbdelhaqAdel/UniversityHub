import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../entities/news_entity.dart';
import '../repositories/news_repo.dart';

class GetNewsUseCase extends UseCase<List<NewsEntity>,NoParam>{
 final NewsRepo newsRepo;

 GetNewsUseCase({required this.newsRepo});
  @override
  Future<Either<Failure, List<NewsEntity>>> call([NoParam? param]) {
  return newsRepo.getNews();
  }

}
