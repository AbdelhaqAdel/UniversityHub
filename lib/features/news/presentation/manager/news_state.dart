
import '../../domain/entities/news_entity.dart';

sealed class NewsState {}

final class NewsInitial extends NewsState {}

class GetNewsLoadingState extends NewsState{}
class GetNewsSuccessState extends NewsState{
  final List<NewsEntity>  newsEntity;
  GetNewsSuccessState({required this.newsEntity});
}
class GetNewsErrorState extends NewsState{
  final String errMessage;
  GetNewsErrorState(this.errMessage);
}
